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

from blocks import *

PARSERS_PXD_HEADER = """
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

from libc.stdint cimport uint32_t, uint16_t, uint8_t, int32_t, int16_t, int8_t
from libc.stdlib cimport free, malloc

ctypedef uint32_t u4
ctypedef uint16_t u2
ctypedef uint8_t u1
ctypedef int32_t i4
ctypedef int16_t i2
ctypedef int8_t i1
ctypedef float f4
ctypedef double f8
ctypedef char c1

cdef dict BLOCKPARSERS
"""

PARSERS_PYX_HEADER = """
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

cdef dict BLOCKPARSERS = dict()

def unknown_toDict(c1 *data):
 return dict()
 
BLOCKPARSERS['Unknown'] = unknown_toDict
"""

SB0_CYFUNC_TEMPLATE = """
def {func_name}(c1 *data):
 cdef {sb0_st_name} *sb0
 sb0 = <{sb0_st_name} *>data
 
 block_dict = dict()
{sb0_as_dict}
 return block_dict

BLOCKPARSERS['{sb0_name}'] = {func_name}
"""
SB1_CYFUNC_TEMPLATE = """
def {func_name}(c1 *data):
 cdef {sb0_st_name} *sb0
 cdef {sb1_st_name} *sb1
 cdef size_t i
 
 cdef {sb1_st_name} **sb1s
 
 sb0 = <{sb0_st_name} *>data
 i = sizeof( {sb0_st_name} )
 
 block_dict = dict()
{sb0_as_dict}
 
 sb1s = <{sb1_st_name} **>malloc( sb0.N * sizeof( {sb1_st_name} * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['{sb1_name}'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <{sb1_st_name}*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
{sb1_as_dict} 
 free(sb1s)
 return block_dict

BLOCKPARSERS['{sb0_name}'] = {func_name}
"""
SB2_CYFUNC_TEMPLATE = """
def {func_name}(c1 *data):
 cdef {sb0_st_name} *sb0
 cdef {sb1_st_name} *sb1
 cdef {sb2_st_name} *sb2
 cdef size_t i
 
 cdef {sb1_st_name} **sb1s
 cdef {sb2_st_name} ***sb2s
 
 sb0 = <{sb0_st_name} *>data
 i = sizeof( {sb0_st_name} )
 
 block_dict = dict()
{sb0_as_dict}
 
 sb1s = <{sb1_st_name} **>malloc( sb0.N1 * sizeof( {sb1_st_name} * ) )
 sb2s = <{sb2_st_name} ***>malloc( sb0.N1 * sizeof( {sb1_st_name} * ) )
 
 sb1_list = [None] * sb0.N1
 block_dict['{sb1_name}'] = sb1_list
 
 for n1 in xrange(sb0.N1):
  sb1 = sb1s[n1] = <{sb1_st_name}*>(data + i)
  i += sb0.SB1Length
  sb1_dict = dict()
  sb1_list[n1] = sb1_dict
{sb1_as_dict}
  
  sb2s[n1] = <{sb2_st_name} **>malloc( sb1.N2 * sizeof( {sb2_st_name} * ) )
  sb2_list = [None] * sb1.N2
  sb1_dict['{sb2_name}'] = sb2_list
  
  for n2 in xrange(sb1.N2):
   sb2 = sb2s[n1][n2] = <{sb2_st_name}*>(data + i)
   i += sb0.SB2Length
   sb2_dict = dict()
   sb2_list[n2] = sb2_dict
{sb2_as_dict}
  free(sb2s[n1])
 free(sb2s)
 free(sb1s)
 return block_dict

BLOCKPARSERS['{sb0_name}'] = {func_name}
"""

PVTResiduals_CYFUNC_TEMPLATE = """
def {func_name}(c1 *data):
 cdef {sb0_st_name} *sb0
 cdef {sb1_st_name} *sb1
 cdef {sb2_st_name} *sb2
 cdef size_t i
 cdef i1 sb1_N2
 
 cdef {sb1_st_name} **sb1s
 cdef {sb2_st_name} ***sb2s
 
 sb0 = <{sb0_st_name} *>data
 i = sizeof( {sb0_st_name} )
 
 block_dict = dict()
{sb0_as_dict}
 
 sb1s = <{sb1_st_name} **>malloc( sb0.N * sizeof( {sb1_st_name} * ) )
 sb2s = <{sb2_st_name} ***>malloc( sb0.N * sizeof( {sb1_st_name} * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['{sb1_name}'] = sb1_list
 
 for n1 in xrange(sb0.N):
  sb1 = sb1s[n1] = <{sb1_st_name}*>(data + i)
  i += sb0.SB1Length
  sb1_dict = dict()
  sb1_list[n1] = sb1_dict
{sb1_as_dict}
  
  sb1_N2 = 0
  if sb1.MeasInfo & (1 << 2):
   sb1_N2 += 1
  if sb1.MeasInfo & (1 << 3):
   sb1_N2 += 1
  if sb1.MeasInfo & (1 << 4):
   sb1_N2 += 1
   
  sb2s[n1] = <{sb2_st_name} **>malloc( sb1_N2 * sizeof( {sb2_st_name} * ) )
  sb2_list = [None] * sb1_N2
  sb1_dict['{sb2_name}'] = sb2_list
  
  for n2 in xrange(sb1_N2):
   sb2 = sb2s[n1][n2] = <{sb2_st_name}*>(data + i)
   i += sb0.SB2Length
   sb2_dict = dict()
   sb2_list[n2] = sb2_dict
{sb2_as_dict}
  free(sb2s[n1])
 free(sb2s)
 free(sb1s)
 return block_dict

BLOCKPARSERS['{sb0_name}'] = {func_name}
"""

def blockDef_cyStructTxt(blockDef, structName):
 s = '\n\ncdef struct {}:\n'.format(structName)
 reserved_i = 0
 for pName, pType in blockDef:
  if pName == 'Reserved':
   pName = '{}_{}'.format(pName, reserved_i)
   reserved_i += 1
  s += ' {} {}\n'.format(pType, pName)
 return s

def sb_dictTxt(blockDef, dict_name, sb_name, indent, ignore={}):
 indent_str = ' ' * indent
 s = str()
 for pName, pType in blockDef:
  if pName != 'Reserved' and pName not in ignore:
   if len(pType) < 3:
    it = "{dict_name}['{pName}'] = {sb_name}.{pName}\n"
    s += indent_str + it.format(dict_name=dict_name, pName=pName, sb_name=sb_name)
   else:
    if pType[2] == '[':
     array_size = pType[3]
     array_type = pType[0]
     byte_size = int(array_size) * int(pType[1])
     it = "{dict_name}['{pName}'] = (<c1*>{sb_name}.{pName})[0:{byte_size}]\n"
     s += indent_str + it.format(dict_name=dict_name, pName=pName, sb_name=sb_name, byte_size=byte_size)
    elif pType[2] == '*':
     it = "{dict_name}['{pName}'] = <c1*>&{sb_name}.{pName}\n"
     s += indent_str + it.format(dict_name=dict_name, pName=pName, sb_name=sb_name)
 return s
 
def sb0_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1)
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt
 
def sb1_txt(sb0_blockDef, sb0_name, sb1_blockDef, sb1_name):
 sb0_st_name = sb0_name
 sb1_st_name = '{}_{}'.format(sb0_name, sb1_name)
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 struct_txt += blockDef_cyStructTxt(sb1_blockDef, sb1_st_name)
 
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'sb1_name': sb1_name, 'sb1_st_name': sb1_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1),
  'sb1_as_dict': sb_dictTxt(sb1_blockDef, 'sb1_dict', 'sb1', 2),
 }
 func_txt = SB1_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def sb2_txt(sb0_blockDef, sb0_name, sb1_blockDef, sb1_name, sb2_blockDef, sb2_name):
 sb0_st_name = sb0_name
 sb1_st_name = '{}_{}'.format(sb0_name, sb1_name)
 sb2_st_name = '{}_{}'.format(sb0_name, sb2_name)
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 struct_txt += blockDef_cyStructTxt(sb1_blockDef, sb1_st_name)
 struct_txt += blockDef_cyStructTxt(sb2_blockDef, sb2_st_name)
 
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'sb1_name': sb1_name, 'sb1_st_name': sb1_st_name,
  'sb2_name': sb2_name, 'sb2_st_name': sb2_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1),
  'sb1_as_dict': sb_dictTxt(sb1_blockDef, 'sb1_dict', 'sb1', 2),
  'sb2_as_dict': sb_dictTxt(sb2_blockDef, 'sb2_dict', 'sb2', 3)
 }
 
 func_txt = SB2_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def GalSARRLM_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 rlmbits_txt = '''
 if sb0.RLMLength == 80:
  block_dict['RLMBits'] = (<c1*>&sb0.RLMBits)[0:12]
 else:
  block_dict['RLMBits'] = (<c1*>&sb0.RLMBits)[0:20]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'RLMBits'}) + rlmbits_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def GEOPRNMask_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 prnmask_txt = '''
 block_dict['PRNMask'] = (<c1*>&sb0.PRNMask)[0:sb0.NbrPRNs]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'PRNMask'}) + prnmask_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def GEOIGPMask_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 igpmask_txt = '''
 block_dict['IGPMask'] = (<c1*>&sb0.IGPMask)[0:sb0.NbrIGPs]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'IGPMask'}) + igpmask_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt 

def PVTResiduals_txt(sb0_blockDef, sb0_name, sb1_blockDef, sb1_name, sb2_blockDef, sb2_name):
 sb0_st_name = sb0_name
 sb1_st_name = '{}_{}'.format(sb0_name, sb1_name)
 sb2_st_name = '{}_{}'.format(sb0_name, sb2_name)
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 struct_txt += blockDef_cyStructTxt(sb1_blockDef, sb1_st_name)
 struct_txt += blockDef_cyStructTxt(sb2_blockDef, sb2_st_name)
 
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'sb1_name': sb1_name, 'sb1_st_name': sb1_st_name,
  'sb2_name': sb2_name, 'sb2_st_name': sb2_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1),
  'sb1_as_dict': sb_dictTxt(sb1_blockDef, 'sb1_dict', 'sb1', 2),
  'sb2_as_dict': sb_dictTxt(sb2_blockDef, 'sb2_dict', 'sb2', 3)
 }
 func_txt = PVTResiduals_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def LBAS1Messages_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 message_txt = '''
 block_dict['Message'] = (<c1*>&sb0.Message)[0:sb0.MessageLength]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'Message'}) + message_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def ExtSensorStatus_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 status_bits_txt = '''
 if sb0.SensorModel == 0:
  if sb0.StatusType == 0:
   block_dict['StatusBits'] = (<c1*>&sb0.StatusBits)[0:56]
  else:
   block_dict['StatusBits'] = (<c1*>&sb0.StatusBits)[0:4]
 else:
  if sb0.StatusType == 0:
   block_dict['StatusBits'] = (<c1*>&sb0.StatusBits)[0:40]
  else:
   block_dict['StatusBits'] = (<c1*>&sb0.StatusBits)[0:1]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'StatusBits'}) + status_bits_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def Comment_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 comm_txt = '''
 block_dict['Comment'] = (<c1*>&sb0.Comment)[0:sb0.CommentLn]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'Comment'}) + comm_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def BBSamples_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 samples_txt = '''
 block_dict['Samples'] = (<c1*>&sb0.Samples)[0:2*sb0.N]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'Samples'}) + samples_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def ASCIIIn_txt(sb0_blockDef, sb0_name):
 sb0_st_name = sb0_name
 
 struct_txt = blockDef_cyStructTxt(sb0_blockDef, sb0_st_name)
 str_txt = '''
 block_dict['ASCIIString'] = (<c1*>&sb0.ASCIIString)[0:sb0.StringLn]
 '''
 func_d = {
  'sb0_name': sb0_name, 'sb0_st_name': sb0_st_name,
  'func_name': sb0_name+'_toDict',
  'sb0_as_dict': sb_dictTxt(sb0_blockDef, 'block_dict', 'sb0', 1, {'ASCIIString'}) + str_txt
 }
 func_txt = SB0_CYFUNC_TEMPLATE.format(**func_d)
 return struct_txt, func_txt

def writeParserFiles(pyx_filename, pxd_filename):
 blockname_cythontxt = (
  ('MeasEpoch_v2', sb2_txt(MeasEpoch_v2, 'MeasEpoch_v2', MeasEpoch_v2_Type_1, 'Type_1', MeasEpoch_v2_Type_2, 'Type_2') ),
  ('MeasExtra', sb1_txt(MeasExtra, 'MeasExtra', MeasExtra_MeasExtraChannel, 'MeasExtraChannel') ),
  ('IQCorr', sb1_txt(IQCorr, 'IQCorr', IQCorr_CorrChannel, 'CorrChannel') ),
  ('EndOfMeas', sb0_txt(EndOfMeas, 'EndOfMeas') ),
  ('GPSRawCA', sb0_txt(GPSRawCA, 'GPSRawCA') ),
  ('GPSRawL2C', sb0_txt(GPSRawL2C, 'GPSRawL2C') ),
  ('GPSRawL5', sb0_txt(GPSRawL5, 'GPSRawL5') ),
  ('GLORawCA', sb0_txt(GLORawCA, 'GLORawCA') ),
  ('GALRawFNAV', sb0_txt(GALRawFNAV, 'GALRawFNAV') ),
  ('GALRawINAV', sb0_txt(GALRawINAV, 'GALRawINAV') ),
  ('GALRawCNAV', sb0_txt(GALRawCNAV, 'GALRawCNAV') ),
  ('GEORawL1', sb0_txt(GEORawL1, 'GEORawL1') ),
  ('CMPRaw', sb0_txt(CMPRaw, 'CMPRaw') ),
  ('QZSRawL1CA', sb0_txt(QZSRawL1CA, 'QZSRawL1CA') ),
  ('QZSRawL2C', sb0_txt(QZSRawL2C, 'QZSRawL2C') ),
  ('QZSRawL5', sb0_txt(QZSRawL5, 'QZSRawL5') ),
  ('GPSNav', sb0_txt(GPSNav, 'GPSNav') ),
  ('GPSAlm', sb0_txt(GPSAlm, 'GPSAlm') ),
  ('GPSIon', sb0_txt(GPSIon, 'GPSIon') ),
  ('GPSUtc', sb0_txt(GPSUtc, 'GPSUtc') ),
  ('GLONav', sb0_txt(GLONav, 'GLONav') ),
  ('GLOTime', sb0_txt(GLOTime, 'GLOTime') ),
  ('GalNav', sb0_txt(GalNav, 'GalNav') ),
  ('GalAlm', sb0_txt(GalAlm, 'GalAlm') ),
  ('GalIon', sb0_txt(GalIon, 'GalIon') ),
  ('GalUtc', sb0_txt(GalUtc, 'GalUtc') ),
  ('GalGstGps', sb0_txt(GalGstGps, 'GalGstGps') ),
  ('GalSARRLM', GalSARRLM_txt(GalSARRLM, 'GalSARRLM') ),
  ('GEOMT00', sb0_txt(GEOMT00, 'GEOMT00') ),
  ('GEOPRNMask', GEOPRNMask_txt(GEOPRNMask, 'GEOPRNMask') ),
  ('GEOFastCorr', sb1_txt(GEOFastCorr, 'GEOFastCorr', GEOFastCorr_FastCorr, 'FastCorr') ),
  ('GEOIntegrity', sb0_txt(GEOIntegrity, 'GEOIntegrity') ),
  ('GEOFastCorrDegr', sb0_txt(GEOFastCorrDegr, 'GEOFastCorrDegr') ),
  ('GEODegrFactors', sb0_txt(GEODegrFactors, 'GEODegrFactors') ),
  ('GEONetworkTime', sb0_txt(GEONetworkTime, 'GEONetworkTime') ),
  ('GEONav', sb0_txt(GEONav, 'GEONav') ),
  ('GEOAlm', sb0_txt(GEOAlm, 'GEOAlm') ),
  ('GEOIGPMask', GEOIGPMask_txt(GEOIGPMask, 'GEOIGPMask') ),
  ('GEOLongTermCorr', sb1_txt(GEOLongTermCorr, 'GEOLongTermCorr', GEOLongTermCorr_LTCorr, 'LTCorr') ),
  ('GEOIonoDelay', sb1_txt(GEOIonoDelay, 'GEOIonoDelay', GEOIonoDelay_IDC, 'IDC') ),
  ('GEOServiceLevel', sb1_txt(GEOServiceLevel, 'GEOServiceLevel', GEOServiceLevel_ServiceRegion, 'ServiceRegion') ),
  ('GEOClockEphCovMatrix', sb1_txt(GEOClockEphCovMatrix, 'GEOClockEphCovMatrix', GEOClockEphCovMatrix_CovMatrix, 'CovMatrix') ),
  ('PVTCartesian_v2', sb0_txt(PVTCartesian_v2, 'PVTCartesian_v2') ),
  ('PVTGeodetic_v2', sb0_txt(PVTGeodetic_v2, 'PVTGeodetic_v2') ),
  ('PosCovCartesian', sb0_txt(PosCovCartesian, 'PosCovCartesian') ),
  ('PosCovGeodetic', sb0_txt(PosCovGeodetic, 'PosCovGeodetic') ),
  ('VelCovCartesian', sb0_txt(VelCovCartesian, 'VelCovCartesian') ),
  ('VelCovGeodetic', sb0_txt(VelCovGeodetic, 'VelCovGeodetic') ),
  ('DOP_v2', sb0_txt(DOP_v2, 'DOP_v2') ),
  ('PosCart', sb0_txt(PosCart, 'PosCart') ),
  ('PVTSatCartesian', sb1_txt(PVTSatCartesian, 'PVTSatCartesian', PVTSatCartesian_SatPos, 'SatPos') ),
  ('PVTResiduals_v2', PVTResiduals_txt(PVTResiduals_v2, 'PVTResiduals_v2',
                                       PVTResiduals_v2_SatSignalInfo, 'SatSignalInfo', 
                                       PVTResiduals_v2_ResidualInfo, 'ResidualInfo') ),
  ('RAIMStatistics_v2', sb0_txt(RAIMStatistics_v2, 'RAIMStatistics_v2') ),
  ('GEOCorrections', sb1_txt(GEOCorrections, 'GEOCorrections', GEOCorrections_SatCorr, 'SatCorr') ),
  ('BaseVectorCart', sb1_txt(BaseVectorCart, 'BaseVectorCart', BaseVectorCart_VectorInfoCart, 'VectorInfoCart') ),
  ('BaseVectorGeod', sb1_txt(BaseVectorGeod, 'BaseVectorGeod', BaseVectorGeod_VectorInfoGeod, 'VectorInfoGeod') ),
  ('PVTSupport', sb0_txt(PVTSupport, 'PVTSupport') ),
  ('EndOfPVT', sb0_txt(EndOfPVT, 'EndOfPVT') ),
  ('IntPVCart', sb0_txt(IntPVCart, 'IntPVCart') ),
  ('IntPVGeod', sb0_txt(IntPVGeod, 'IntPVGeod') ),
  ('IntPosCovCart', sb0_txt(IntPosCovCart, 'IntPosCovCart') ),
  ('IntVelCovCart', sb0_txt(IntVelCovCart, 'IntVelCovCart') ),
  ('IntPosCovGeod', sb0_txt(IntPosCovGeod, 'IntPosCovGeod') ),
  ('IntVelCovGeod', sb0_txt(IntVelCovGeod, 'IntVelCovGeod') ),
  ('IntAttEuler', sb0_txt(IntAttEuler, 'IntAttEuler') ),
  ('IntAttCovEuler', sb0_txt(IntAttCovEuler, 'IntAttCovEuler') ),
  ('IntPVAAGeod', sb0_txt(IntPVAAGeod, 'IntPVAAGeod') ),
  ('AuxAntPositions', sb1_txt(AuxAntPositions, 'AuxAntPositions', AuxAntPositions_AuxAntPosition, 'AuxAntPosition') ),
  ('AttEuler', sb0_txt(AttEuler, 'AttEuler') ),
  ('AttCovEuler', sb0_txt(AttCovEuler, 'AttCovEuler') ),
  ('EndOfAtt', sb0_txt(EndOfAtt, 'EndOfAtt') ),
  ('ReceiverTime', sb0_txt(ReceiverTime, 'ReceiverTime') ),
  ('xPPSOffset', sb0_txt(xPPSOffset, 'xPPSOffset') ),
  ('ExtEvent', sb0_txt(ExtEvent, 'ExtEvent') ) ,
  ('ExtEventPVTCartesian', sb0_txt(ExtEventPVTCartesian, 'ExtEventPVTCartesian') ),
  ('ExtEventPVTGeodetic', sb0_txt(ExtEventPVTGeodetic, 'ExtEventPVTGeodetic') ),
  ('DiffCorrIn', sb0_txt(DiffCorrIn, 'DiffCorrIn') ),
  ('BaseStation', sb0_txt(BaseStation, 'BaseStation') ),
  ('LBandTrackerStatus', sb1_txt(LBandTrackerStatus, 'LBandTrackerStatus', LBandTrackerStatus_TrackData, 'TrackData') ),
  ('LBAS1DecoderStatus', sb0_txt(LBAS1DecoderStatus, 'DecoderStatus') ),
  ('LBAS1Messages', LBAS1Messages_txt(LBAS1Messages, 'LBAS1Messages') ),
  ('ExtSensorMeas', sb1_txt(ExtSensorMeas, 'ExtSensorMeas', ExtSensorMeas_MeasSet, 'MeasSet') ),
  ('ExtSensorStatus', ExtSensorStatus_txt(ExtSensorStatus, 'ExtSensorStatus') ),
  ('ExtSensorSetup', sb1_txt(ExtSensorSetup, 'ExtSensorSetup', ExtSensorSetup_OneSensor, 'OneSensor') ),
  ('ChannelStatus', sb2_txt(ChannelStatus, 'ChannelStatus', ChannelStatus_ChannelSatInfo, 'ChannelSatInfo',
                            ChannelStatus_ChannelStateInfo, 'ChannelStateInfo') ),
  ('ReceiverStatus_v2', sb1_txt(ReceiverStatus_v2, 'ReceiverStatus_v2', ReceiverStatus_v2_AGCData, 'AGCData') ),
  ('SatVisibility', sb1_txt(SatVisibility, 'SatVisibility', SatVisibility_SatInfo, 'SatInfo') ),
  ('InputLink', sb1_txt(InputLink, 'InputLink', InputLink_InputStats, 'InputStats') ),
  ('OutputLink', sb2_txt(OutputLink, 'OutputLink', OutputLink_OutputStats, 'OutputStats', OutputLink_OutputType, 'OutputType') ),
  ('IPStatus', sb0_txt(IPStatus, 'IPStatus') ),
  ('ReceiverSetup', sb0_txt(ReceiverSetup, 'ReceiverSetup') ),
  ('Commands', sb0_txt(Commands, 'Commands') ),
  ('Comment', Comment_txt(Comment, 'Comment') ),
  ('BBSamples', BBSamples_txt(BBSamples, 'BBSamples') ),
  ('ASCIIIn', ASCIIIn_txt(ASCIIIn, 'ASCIIIn') ),
 )
 pyx_f = open(pyx_filename, 'w')
 pxd_f = open(pxd_filename, 'w')
 
 pxd_f.write(PARSERS_PXD_HEADER)
 pyx_f.write(PARSERS_PYX_HEADER)
 
 for bName, (struct_txt, func_txt) in blockname_cythontxt:
  pxd_f.write(struct_txt)
  pyx_f.write(func_txt)
 
 pyx_f.close()
 pxd_f.close()
