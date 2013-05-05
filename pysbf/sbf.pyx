#This file is part of "pysbf".
#Copyright (c) 2013, Jashandeep Sohi (jashandeep.s.sohi@gmail.com)
#
#"pysbf" is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#"pysbf" is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.


from blocks import BLOCKNAMES, BLOCKNUMBERS

from parsers cimport BLOCKPARSERS

from libc.stdint cimport uint16_t, uint8_t
from libc.stdio cimport fread, fdopen, FILE, fseek, SEEK_CUR
from libc.stdlib cimport malloc, free

from crc cimport crc16


cdef struct Header:
 uint16_t Sync
 uint16_t CRC
 uint16_t ID
 uint16_t Length

def load(fobj, size_t limit=-1, blocknames=set()):
 try:
  fileno = fobj.fileno()
 except:
  raise Exception('Could not obtain fileno from file-like object')
  
 cdef Header h
 cdef FILE *f = fdopen(fileno, 'rb')
 cdef uint16_t blockno
 cdef void *body_ptr
 cdef size_t body_length
 
 num_name_dict = dict(zip(BLOCKNUMBERS, BLOCKNAMES))
 if blocknames:
  blockparsers = {x: BLOCKPARSERS.get(x, BLOCKPARSERS['Unknown']) for x in blocknames & set(num_name_dict.viewvalues())}
 else:
  blockparsers = {x: BLOCKPARSERS.get(x, BLOCKPARSERS['Unknown']) for x in set(num_name_dict.viewvalues())}
 
 if not blockparsers:
  return ()

 while True:
  if limit == 0: break
  if not fread(&h, 8, 1, f): break
  if h.Sync == 16420:
   if h.Length % 4 == 0:
    body_length = h.Length-8
    body_ptr = malloc(body_length)
    if not fread(body_ptr, body_length, 1, f): break
    if h.CRC == crc16(body_ptr, body_length, crc16(&(h.ID), 4, 0) ):
     blockno = h.ID & 0x1fff
     blockname = num_name_dict.get(blockno, 'Unknown')
     parser_func = blockparsers.get(blockname)
     if parser_func:
      block_dict = parser_func((<char*>body_ptr)[0:body_length])
      yield blockname, block_dict
      limit -= 1
     free(body_ptr)
    else:
     fseek(f, -h.Length+2, SEEK_CUR)
     free(body_ptr)
     continue
   else:
    fseek(f, -6, SEEK_CUR)
    continue
  else: 
   fseek(f, -6, SEEK_CUR)
   continue
   
  
   
