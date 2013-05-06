
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
cdef dict BLOCKPARSERS_BYTES = dict()

def unknown_toDict(c1 *data):
 return dict()
 
BLOCKPARSERS['Unknown'] = unknown_toDict
BLOCKPARSERS_BYTES['Unknown'] = unknown_toDict

def MeasEpoch_v2_toDict(c1 *data):
 cdef MeasEpoch_v2 *sb0
 cdef MeasEpoch_v2_Type_1 *sb1
 cdef MeasEpoch_v2_Type_2 *sb2
 cdef size_t i
 
 cdef MeasEpoch_v2_Type_1 **sb1s
 cdef MeasEpoch_v2_Type_2 ***sb2s
 
 sb0 = <MeasEpoch_v2 *>data
 i = sizeof( MeasEpoch_v2 )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N1'] = sb0.N1
 block_dict['SB1Length'] = sb0.SB1Length
 block_dict['SB2Length'] = sb0.SB2Length
 block_dict['CommonFlags'] = sb0.CommonFlags
 block_dict['CumClkJumps'] = sb0.CumClkJumps

 
 sb1s = <MeasEpoch_v2_Type_1 **>malloc( sb0.N1 * sizeof( MeasEpoch_v2_Type_1 * ) )
 sb2s = <MeasEpoch_v2_Type_2 ***>malloc( sb0.N1 * sizeof( MeasEpoch_v2_Type_1 * ) )
 
 sb1_list = [None] * sb0.N1
 block_dict['Type_1'] = sb1_list
 
 for n1 in xrange(sb0.N1):
  sb1 = sb1s[n1] = <MeasEpoch_v2_Type_1*>(data + i)
  i += sb0.SB1Length
  sb1_dict = dict()
  sb1_list[n1] = sb1_dict
  sb1_dict['RxChannel'] = sb1.RxChannel
  sb1_dict['Type'] = sb1.Type
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['Misc'] = sb1.Misc
  sb1_dict['CodeLSB'] = sb1.CodeLSB
  sb1_dict['Doppler'] = sb1.Doppler
  sb1_dict['CarrierLSB'] = sb1.CarrierLSB
  sb1_dict['CarrierMSB'] = sb1.CarrierMSB
  sb1_dict['CN0'] = sb1.CN0
  sb1_dict['LockTime'] = sb1.LockTime
  sb1_dict['ObsInfo'] = sb1.ObsInfo
  sb1_dict['N2'] = sb1.N2

  
  sb2s[n1] = <MeasEpoch_v2_Type_2 **>malloc( sb1.N2 * sizeof( MeasEpoch_v2_Type_2 * ) )
  sb2_list = [None] * sb1.N2
  sb1_dict['Type_2'] = sb2_list
  
  for n2 in xrange(sb1.N2):
   sb2 = sb2s[n1][n2] = <MeasEpoch_v2_Type_2*>(data + i)
   i += sb0.SB2Length
   sb2_dict = dict()
   sb2_list[n2] = sb2_dict
   sb2_dict['Type'] = sb2.Type
   sb2_dict['LockTime'] = sb2.LockTime
   sb2_dict['CN0'] = sb2.CN0
   sb2_dict['OffsetMSB'] = sb2.OffsetMSB
   sb2_dict['CarrierMSB'] = sb2.CarrierMSB
   sb2_dict['ObsInfo'] = sb2.ObsInfo
   sb2_dict['CodeOffsetLSB'] = sb2.CodeOffsetLSB
   sb2_dict['CarrierLSB'] = sb2.CarrierLSB
   sb2_dict['DopplerOffsetLSB'] = sb2.DopplerOffsetLSB

  free(sb2s[n1])
 free(sb2s)
 free(sb1s)
 return block_dict

BLOCKPARSERS['MeasEpoch_v2'] = MeasEpoch_v2_toDict

def MeasExtra_toDict(c1 *data):
 cdef MeasExtra *sb0
 cdef MeasExtra_MeasExtraChannel *sb1
 cdef size_t i
 
 cdef MeasExtra_MeasExtraChannel **sb1s
 
 sb0 = <MeasExtra *>data
 i = sizeof( MeasExtra )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength
 block_dict['DopplerVarFactor'] = sb0.DopplerVarFactor

 
 sb1s = <MeasExtra_MeasExtraChannel **>malloc( sb0.N * sizeof( MeasExtra_MeasExtraChannel * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['MeasExtraChannel'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <MeasExtra_MeasExtraChannel*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['RxChannel'] = sb1.RxChannel
  sb1_dict['Type'] = sb1.Type
  sb1_dict['MPCorrection '] = sb1.MPCorrection 
  sb1_dict['SmoothingCorr'] = sb1.SmoothingCorr
  sb1_dict['CodeVar'] = sb1.CodeVar
  sb1_dict['CarrierVar'] = sb1.CarrierVar
  sb1_dict['LockTime'] = sb1.LockTime
  sb1_dict['CumLossCont'] = sb1.CumLossCont
  sb1_dict['Info'] = sb1.Info
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['MeasExtra'] = MeasExtra_toDict

def IQCorr_toDict(c1 *data):
 cdef IQCorr *sb0
 cdef IQCorr_CorrChannel *sb1
 cdef size_t i
 
 cdef IQCorr_CorrChannel **sb1s
 
 sb0 = <IQCorr *>data
 i = sizeof( IQCorr )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength
 block_dict['CorrDuration'] = sb0.CorrDuration
 block_dict['CumClkJumps'] = sb0.CumClkJumps

 
 sb1s = <IQCorr_CorrChannel **>malloc( sb0.N * sizeof( IQCorr_CorrChannel * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['CorrChannel'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <IQCorr_CorrChannel*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['RxChannel'] = sb1.RxChannel
  sb1_dict['Type'] = sb1.Type
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['CorrIQ_MSB'] = sb1.CorrIQ_MSB
  sb1_dict['CorrI_LSB'] = sb1.CorrI_LSB
  sb1_dict['CorrQ_LSB'] = sb1.CorrQ_LSB
  sb1_dict['CarrierPhaseLSB'] = sb1.CarrierPhaseLSB
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['IQCorr'] = IQCorr_toDict

def EndOfMeas_toDict(c1 *data):
 cdef EndOfMeas *sb0
 sb0 = <EndOfMeas *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc

 return block_dict

BLOCKPARSERS['EndOfMeas'] = EndOfMeas_toDict

def GPSRawCA_toDict(c1 *data):
 cdef GPSRawCA *sb0
 sb0 = <GPSRawCA *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['GPSRawCA'] = GPSRawCA_toDict

def GPSRawL2C_toDict(c1 *data):
 cdef GPSRawL2C *sb0
 sb0 = <GPSRawL2C *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['GPSRawL2C'] = GPSRawL2C_toDict

def GPSRawL5_toDict(c1 *data):
 cdef GPSRawL5 *sb0
 sb0 = <GPSRawL5 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['GPSRawL5'] = GPSRawL5_toDict

def GLORawCA_toDict(c1 *data):
 cdef GLORawCA *sb0
 sb0 = <GLORawCA *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:12]

 return block_dict

BLOCKPARSERS['GLORawCA'] = GLORawCA_toDict

def GALRawFNAV_toDict(c1 *data):
 cdef GALRawFNAV *sb0
 sb0 = <GALRawFNAV *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:32]

 return block_dict

BLOCKPARSERS['GALRawFNAV'] = GALRawFNAV_toDict

def GALRawINAV_toDict(c1 *data):
 cdef GALRawINAV *sb0
 sb0 = <GALRawINAV *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:32]

 return block_dict

BLOCKPARSERS['GALRawINAV'] = GALRawINAV_toDict

def GALRawCNAV_toDict(c1 *data):
 cdef GALRawCNAV *sb0
 sb0 = <GALRawCNAV *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:64]

 return block_dict

BLOCKPARSERS['GALRawCNAV'] = GALRawCNAV_toDict

def GEORawL1_toDict(c1 *data):
 cdef GEORawL1 *sb0
 sb0 = <GEORawL1 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:32]

 return block_dict

BLOCKPARSERS['GEORawL1'] = GEORawL1_toDict

def CMPRaw_toDict(c1 *data):
 cdef CMPRaw *sb0
 sb0 = <CMPRaw *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['CMPRaw'] = CMPRaw_toDict

def QZSRawL1CA_toDict(c1 *data):
 cdef QZSRawL1CA *sb0
 sb0 = <QZSRawL1CA *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['QZSRawL1CA'] = QZSRawL1CA_toDict

def QZSRawL2C_toDict(c1 *data):
 cdef QZSRawL2C *sb0
 sb0 = <QZSRawL2C *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['QZSRawL2C'] = QZSRawL2C_toDict

def QZSRawL5_toDict(c1 *data):
 cdef QZSRawL5 *sb0
 sb0 = <QZSRawL5 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['CRCPassed'] = sb0.CRCPassed
 block_dict['ViterbiCount'] = sb0.ViterbiCount
 block_dict['Source'] = sb0.Source
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['NAVBits'] = (<c1*>sb0.NAVBits)[0:40]

 return block_dict

BLOCKPARSERS['QZSRawL5'] = QZSRawL5_toDict

def GPSNav_toDict(c1 *data):
 cdef GPSNav *sb0
 sb0 = <GPSNav *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['WN'] = sb0.WN
 block_dict['CAorPonL2'] = sb0.CAorPonL2
 block_dict['URA'] = sb0.URA
 block_dict['health'] = sb0.health
 block_dict['L2DataFlag'] = sb0.L2DataFlag
 block_dict['IODC'] = sb0.IODC
 block_dict['IODE2'] = sb0.IODE2
 block_dict['IODE3'] = sb0.IODE3
 block_dict['FitIntFlg'] = sb0.FitIntFlg
 block_dict['T_gd'] = sb0.T_gd
 block_dict['T_oc'] = sb0.T_oc
 block_dict['A_f2'] = sb0.A_f2
 block_dict['A_f1'] = sb0.A_f1
 block_dict['A_f0'] = sb0.A_f0
 block_dict['C_rs'] = sb0.C_rs
 block_dict['DELTA_N'] = sb0.DELTA_N
 block_dict['M_0'] = sb0.M_0
 block_dict['C_uc'] = sb0.C_uc
 block_dict['E'] = sb0.E
 block_dict['C_us'] = sb0.C_us
 block_dict['SQRT_A'] = sb0.SQRT_A
 block_dict['T_oe'] = sb0.T_oe
 block_dict['C_ic'] = sb0.C_ic
 block_dict['OMEGA_0'] = sb0.OMEGA_0
 block_dict['C_is'] = sb0.C_is
 block_dict['I_0'] = sb0.I_0
 block_dict['C_rc'] = sb0.C_rc
 block_dict['omega'] = sb0.omega
 block_dict['OMEGADOT'] = sb0.OMEGADOT
 block_dict['IDOT'] = sb0.IDOT
 block_dict['WNt_oc'] = sb0.WNt_oc
 block_dict['WNt_oe'] = sb0.WNt_oe

 return block_dict

BLOCKPARSERS['GPSNav'] = GPSNav_toDict

def GPSAlm_toDict(c1 *data):
 cdef GPSAlm *sb0
 sb0 = <GPSAlm *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['E'] = sb0.E
 block_dict['t_oa'] = sb0.t_oa
 block_dict['Delta_i'] = sb0.Delta_i
 block_dict['OMEGADOT'] = sb0.OMEGADOT
 block_dict['SQRT_A'] = sb0.SQRT_A
 block_dict['OMEGA_0'] = sb0.OMEGA_0
 block_dict['Omega'] = sb0.Omega
 block_dict['M_0'] = sb0.M_0
 block_dict['a_f1'] = sb0.a_f1
 block_dict['a_f0'] = sb0.a_f0
 block_dict['WN_a'] = sb0.WN_a
 block_dict['AS_config'] = sb0.AS_config
 block_dict['health8'] = sb0.health8
 block_dict['health6'] = sb0.health6

 return block_dict

BLOCKPARSERS['GPSAlm'] = GPSAlm_toDict

def GPSIon_toDict(c1 *data):
 cdef GPSIon *sb0
 sb0 = <GPSIon *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['alpha_0'] = sb0.alpha_0
 block_dict['alpha_1'] = sb0.alpha_1
 block_dict['alpha_2'] = sb0.alpha_2
 block_dict['alpha_3'] = sb0.alpha_3
 block_dict['beta_0'] = sb0.beta_0
 block_dict['beta_1'] = sb0.beta_1
 block_dict['beta_2'] = sb0.beta_2
 block_dict['beta_3'] = sb0.beta_3

 return block_dict

BLOCKPARSERS['GPSIon'] = GPSIon_toDict

def GPSUtc_toDict(c1 *data):
 cdef GPSUtc *sb0
 sb0 = <GPSUtc *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['A_1'] = sb0.A_1
 block_dict['A_0'] = sb0.A_0
 block_dict['t_ot'] = sb0.t_ot
 block_dict['WN_t'] = sb0.WN_t
 block_dict['DEL_t_LS'] = sb0.DEL_t_LS
 block_dict['WN_LSF'] = sb0.WN_LSF
 block_dict['DN'] = sb0.DN
 block_dict['DEL_t_LSF'] = sb0.DEL_t_LSF

 return block_dict

BLOCKPARSERS['GPSUtc'] = GPSUtc_toDict

def GLONav_toDict(c1 *data):
 cdef GLONav *sb0
 sb0 = <GLONav *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['X'] = sb0.X
 block_dict['Y'] = sb0.Y
 block_dict['Z'] = sb0.Z
 block_dict['Dx'] = sb0.Dx
 block_dict['Dy'] = sb0.Dy
 block_dict['Dz'] = sb0.Dz
 block_dict['Ddx'] = sb0.Ddx
 block_dict['Ddy'] = sb0.Ddy
 block_dict['Ddz'] = sb0.Ddz
 block_dict['gamma'] = sb0.gamma
 block_dict['tau'] = sb0.tau
 block_dict['dtau'] = sb0.dtau
 block_dict['t_oe'] = sb0.t_oe
 block_dict['WN_toe'] = sb0.WN_toe
 block_dict['P1'] = sb0.P1
 block_dict['P2'] = sb0.P2
 block_dict['E'] = sb0.E
 block_dict['B'] = sb0.B
 block_dict['tb'] = sb0.tb
 block_dict['M'] = sb0.M
 block_dict['P'] = sb0.P
 block_dict['l'] = sb0.l
 block_dict['P4'] = sb0.P4
 block_dict['N_T'] = sb0.N_T
 block_dict['F_T'] = sb0.F_T

 return block_dict

BLOCKPARSERS['GLONav'] = GLONav_toDict

def GLOTime_toDict(c1 *data):
 cdef GLOTime *sb0
 sb0 = <GLOTime *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['FreqNr'] = sb0.FreqNr
 block_dict['N_4'] = sb0.N_4
 block_dict['KP'] = sb0.KP
 block_dict['N'] = sb0.N
 block_dict['tau_GPS'] = sb0.tau_GPS
 block_dict['tau_c'] = sb0.tau_c
 block_dict['B1'] = sb0.B1
 block_dict['B2'] = sb0.B2

 return block_dict

BLOCKPARSERS['GLOTime'] = GLOTime_toDict

def GalNav_toDict(c1 *data):
 cdef GalNav *sb0
 sb0 = <GalNav *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['Source'] = sb0.Source
 block_dict['SQRT_A'] = sb0.SQRT_A
 block_dict['M_0'] = sb0.M_0
 block_dict['E'] = sb0.E
 block_dict['i_0'] = sb0.i_0
 block_dict['Omega'] = sb0.Omega
 block_dict['OMEGA_0'] = sb0.OMEGA_0
 block_dict['OMEGADOT'] = sb0.OMEGADOT
 block_dict['IDOT'] = sb0.IDOT
 block_dict['DELTA_N'] = sb0.DELTA_N
 block_dict['C_uc'] = sb0.C_uc
 block_dict['C_us'] = sb0.C_us
 block_dict['C_rc'] = sb0.C_rc
 block_dict['C_rs'] = sb0.C_rs
 block_dict['C_ic'] = sb0.C_ic
 block_dict['C_is'] = sb0.C_is
 block_dict['t_oe'] = sb0.t_oe
 block_dict['t_oc'] = sb0.t_oc
 block_dict['a_f2'] = sb0.a_f2
 block_dict['a_f1'] = sb0.a_f1
 block_dict['a_f0'] = sb0.a_f0
 block_dict['WNt_oc'] = sb0.WNt_oc
 block_dict['WNt_oe'] = sb0.WNt_oe
 block_dict['IODnav'] = sb0.IODnav
 block_dict['Health_OSSOL'] = sb0.Health_OSSOL
 block_dict['SISA_L1E5a'] = sb0.SISA_L1E5a
 block_dict['SISA_L1E5b'] = sb0.SISA_L1E5b
 block_dict['BGD_L1E5a'] = sb0.BGD_L1E5a
 block_dict['BGD_L1E5b'] = sb0.BGD_L1E5b
 block_dict['CNAVEncrypt'] = sb0.CNAVEncrypt

 return block_dict

BLOCKPARSERS['GalNav'] = GalNav_toDict

def GalAlm_toDict(c1 *data):
 cdef GalAlm *sb0
 sb0 = <GalAlm *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['Source'] = sb0.Source
 block_dict['e'] = sb0.e
 block_dict['t_oa'] = sb0.t_oa
 block_dict['Delta_i'] = sb0.Delta_i
 block_dict['OMEGADOT'] = sb0.OMEGADOT
 block_dict['DeltaSQRT_A'] = sb0.DeltaSQRT_A
 block_dict['OMEGA_0'] = sb0.OMEGA_0
 block_dict['Omega'] = sb0.Omega
 block_dict['M_0'] = sb0.M_0
 block_dict['a_f1'] = sb0.a_f1
 block_dict['a_f0'] = sb0.a_f0
 block_dict['WN_a'] = sb0.WN_a
 block_dict['SVID_A'] = sb0.SVID_A
 block_dict['health'] = sb0.health
 block_dict['IODa'] = sb0.IODa

 return block_dict

BLOCKPARSERS['GalAlm'] = GalAlm_toDict

def GalIon_toDict(c1 *data):
 cdef GalIon *sb0
 sb0 = <GalIon *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['Source'] = sb0.Source
 block_dict['a_i0'] = sb0.a_i0
 block_dict['a_i1'] = sb0.a_i1
 block_dict['a_i2'] = sb0.a_i2
 block_dict['StormFlags'] = sb0.StormFlags

 return block_dict

BLOCKPARSERS['GalIon'] = GalIon_toDict

def GalUtc_toDict(c1 *data):
 cdef GalUtc *sb0
 sb0 = <GalUtc *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['Source'] = sb0.Source
 block_dict['A_1'] = sb0.A_1
 block_dict['A_0'] = sb0.A_0
 block_dict['t_ot'] = sb0.t_ot
 block_dict['WN_ot'] = sb0.WN_ot
 block_dict['DEL_t_LS'] = sb0.DEL_t_LS
 block_dict['WN_LSF'] = sb0.WN_LSF
 block_dict['DN'] = sb0.DN
 block_dict['DEL_t_LSF'] = sb0.DEL_t_LSF

 return block_dict

BLOCKPARSERS['GalUtc'] = GalUtc_toDict

def GalGstGps_toDict(c1 *data):
 cdef GalGstGps *sb0
 sb0 = <GalGstGps *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['Source'] = sb0.Source
 block_dict['A_1G'] = sb0.A_1G
 block_dict['A_0G'] = sb0.A_0G
 block_dict['t_oG'] = sb0.t_oG
 block_dict['WN_oG'] = sb0.WN_oG

 return block_dict

BLOCKPARSERS['GalGstGps'] = GalGstGps_toDict

def GalSARRLM_toDict(c1 *data):
 cdef GalSARRLM *sb0
 sb0 = <GalSARRLM *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SVID'] = sb0.SVID
 block_dict['Source'] = sb0.Source
 block_dict['RLMLength'] = sb0.RLMLength

 if sb0.RLMLength == 80:
  block_dict['RLMBits'] = (<c1*>&sb0.RLMBits)[0:12]
 else:
  block_dict['RLMBits'] = (<c1*>&sb0.RLMBits)[0:20]
 
 return block_dict

BLOCKPARSERS['GalSARRLM'] = GalSARRLM_toDict

def GEOMT00_toDict(c1 *data):
 cdef GEOMT00 *sb0
 sb0 = <GEOMT00 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN

 return block_dict

BLOCKPARSERS['GEOMT00'] = GEOMT00_toDict

def GEOPRNMask_toDict(c1 *data):
 cdef GEOPRNMask *sb0
 sb0 = <GEOPRNMask *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['IODP'] = sb0.IODP
 block_dict['NbrPRNs'] = sb0.NbrPRNs

 block_dict['PRNMask'] = (<c1*>&sb0.PRNMask)[0:sb0.NbrPRNs]
 
 return block_dict

BLOCKPARSERS['GEOPRNMask'] = GEOPRNMask_toDict

def GEOFastCorr_toDict(c1 *data):
 cdef GEOFastCorr *sb0
 cdef GEOFastCorr_FastCorr *sb1
 cdef size_t i
 
 cdef GEOFastCorr_FastCorr **sb1s
 
 sb0 = <GEOFastCorr *>data
 i = sizeof( GEOFastCorr )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['MT'] = sb0.MT
 block_dict['IODP'] = sb0.IODP
 block_dict['IODF'] = sb0.IODF
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <GEOFastCorr_FastCorr **>malloc( sb0.N * sizeof( GEOFastCorr_FastCorr * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['FastCorr'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <GEOFastCorr_FastCorr*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['PRNMaskNo'] = sb1.PRNMaskNo
  sb1_dict['UDREI'] = sb1.UDREI
  sb1_dict['PRC'] = sb1.PRC
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['GEOFastCorr'] = GEOFastCorr_toDict

def GEOIntegrity_toDict(c1 *data):
 cdef GEOIntegrity *sb0
 sb0 = <GEOIntegrity *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['IODF'] = (<c1*>sb0.IODF)[0:4]
 block_dict['UDREI'] = (<c1*>sb0.UDREI)[0:51]

 return block_dict

BLOCKPARSERS['GEOIntegrity'] = GEOIntegrity_toDict

def GEOFastCorrDegr_toDict(c1 *data):
 cdef GEOFastCorrDegr *sb0
 sb0 = <GEOFastCorrDegr *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['IODP'] = sb0.IODP
 block_dict['t_lat'] = sb0.t_lat
 block_dict['AI'] = (<c1*>sb0.AI)[0:51]

 return block_dict

BLOCKPARSERS['GEOFastCorrDegr'] = GEOFastCorrDegr_toDict

def GEODegrFactors_toDict(c1 *data):
 cdef GEODegrFactors *sb0
 sb0 = <GEODegrFactors *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['Brrc'] = sb0.Brrc
 block_dict['Cltc_lsb'] = sb0.Cltc_lsb
 block_dict['Cltc_v1'] = sb0.Cltc_v1
 block_dict['Iltc_v1'] = sb0.Iltc_v1
 block_dict['Cltc_v0'] = sb0.Cltc_v0
 block_dict['Iltc_v0'] = sb0.Iltc_v0
 block_dict['Cgeo_lsb'] = sb0.Cgeo_lsb
 block_dict['Cgeo_v'] = sb0.Cgeo_v
 block_dict['Igeo'] = sb0.Igeo
 block_dict['Cer'] = sb0.Cer
 block_dict['Ciono_step'] = sb0.Ciono_step
 block_dict['Iiono'] = sb0.Iiono
 block_dict['Ciono_ramp'] = sb0.Ciono_ramp
 block_dict['RSSudre'] = sb0.RSSudre
 block_dict['RSSiono'] = sb0.RSSiono
 block_dict['Ccovariance'] = sb0.Ccovariance

 return block_dict

BLOCKPARSERS['GEODegrFactors'] = GEODegrFactors_toDict

def GEONetworkTime_toDict(c1 *data):
 cdef GEONetworkTime *sb0
 sb0 = <GEONetworkTime *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['A1'] = sb0.A1
 block_dict['A0'] = sb0.A0
 block_dict['t_ot'] = sb0.t_ot
 block_dict['WNt'] = sb0.WNt
 block_dict['DEL_t_1S'] = sb0.DEL_t_1S
 block_dict['WN_LSF'] = sb0.WN_LSF
 block_dict['DN'] = sb0.DN
 block_dict['DEL_t_LSF'] = sb0.DEL_t_LSF
 block_dict['UTCStdId'] = sb0.UTCStdId
 block_dict['GPSWN'] = sb0.GPSWN
 block_dict['GPSTOW'] = sb0.GPSTOW
 block_dict['GLONASSind'] = sb0.GLONASSind

 return block_dict

BLOCKPARSERS['GEONetworkTime'] = GEONetworkTime_toDict

def GEONav_toDict(c1 *data):
 cdef GEONav *sb0
 sb0 = <GEONav *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['IODN_Spare'] = sb0.IODN_Spare
 block_dict['URA'] = sb0.URA
 block_dict['t0'] = sb0.t0
 block_dict['Xg'] = sb0.Xg
 block_dict['Yg'] = sb0.Yg
 block_dict['Zg'] = sb0.Zg
 block_dict['Xgd'] = sb0.Xgd
 block_dict['Ygd'] = sb0.Ygd
 block_dict['Zgd'] = sb0.Zgd
 block_dict['Xgdd'] = sb0.Xgdd
 block_dict['Ygdd'] = sb0.Ygdd
 block_dict['Zgdd'] = sb0.Zgdd
 block_dict['AGf0'] = sb0.AGf0
 block_dict['AGf1'] = sb0.AGf1

 return block_dict

BLOCKPARSERS['GEONav'] = GEONav_toDict

def GEOAlm_toDict(c1 *data):
 cdef GEOAlm *sb0
 sb0 = <GEOAlm *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['DataID'] = sb0.DataID
 block_dict['Health'] = sb0.Health
 block_dict['t0'] = sb0.t0
 block_dict['Xg'] = sb0.Xg
 block_dict['Yg'] = sb0.Yg
 block_dict['Zg'] = sb0.Zg
 block_dict['Xgd'] = sb0.Xgd
 block_dict['Ygd'] = sb0.Ygd
 block_dict['Zgd'] = sb0.Zgd

 return block_dict

BLOCKPARSERS['GEOAlm'] = GEOAlm_toDict

def GEOIGPMask_toDict(c1 *data):
 cdef GEOIGPMask *sb0
 sb0 = <GEOIGPMask *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['NbrBands'] = sb0.NbrBands
 block_dict['BandNbr'] = sb0.BandNbr
 block_dict['IODI'] = sb0.IODI
 block_dict['NbrIGPs'] = sb0.NbrIGPs

 block_dict['IGPMask'] = (<c1*>&sb0.IGPMask)[0:sb0.NbrIGPs]
 
 return block_dict

BLOCKPARSERS['GEOIGPMask'] = GEOIGPMask_toDict

def GEOLongTermCorr_toDict(c1 *data):
 cdef GEOLongTermCorr *sb0
 cdef GEOLongTermCorr_LTCorr *sb1
 cdef size_t i
 
 cdef GEOLongTermCorr_LTCorr **sb1s
 
 sb0 = <GEOLongTermCorr *>data
 i = sizeof( GEOLongTermCorr )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <GEOLongTermCorr_LTCorr **>malloc( sb0.N * sizeof( GEOLongTermCorr_LTCorr * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['LTCorr'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <GEOLongTermCorr_LTCorr*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['VelocityCode'] = sb1.VelocityCode
  sb1_dict['PRNMaskNo'] = sb1.PRNMaskNo
  sb1_dict['IODP'] = sb1.IODP
  sb1_dict['IODE'] = sb1.IODE
  sb1_dict['dx'] = sb1.dx
  sb1_dict['dy'] = sb1.dy
  sb1_dict['dz'] = sb1.dz
  sb1_dict['dxRate'] = sb1.dxRate
  sb1_dict['dyRate'] = sb1.dyRate
  sb1_dict['dzRate'] = sb1.dzRate
  sb1_dict['da_f0'] = sb1.da_f0
  sb1_dict['da_f1'] = sb1.da_f1
  sb1_dict['t_oe'] = sb1.t_oe
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['GEOLongTermCorr'] = GEOLongTermCorr_toDict

def GEOIonoDelay_toDict(c1 *data):
 cdef GEOIonoDelay *sb0
 cdef GEOIonoDelay_IDC *sb1
 cdef size_t i
 
 cdef GEOIonoDelay_IDC **sb1s
 
 sb0 = <GEOIonoDelay *>data
 i = sizeof( GEOIonoDelay )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['BandNbr'] = sb0.BandNbr
 block_dict['IODI'] = sb0.IODI
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <GEOIonoDelay_IDC **>malloc( sb0.N * sizeof( GEOIonoDelay_IDC * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['IDC'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <GEOIonoDelay_IDC*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['IGPMaskNo'] = sb1.IGPMaskNo
  sb1_dict['GIVEI'] = sb1.GIVEI
  sb1_dict['VerticalDelay'] = sb1.VerticalDelay
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['GEOIonoDelay'] = GEOIonoDelay_toDict

def GEOServiceLevel_toDict(c1 *data):
 cdef GEOServiceLevel *sb0
 cdef GEOServiceLevel_ServiceRegion *sb1
 cdef size_t i
 
 cdef GEOServiceLevel_ServiceRegion **sb1s
 
 sb0 = <GEOServiceLevel *>data
 i = sizeof( GEOServiceLevel )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['IODS'] = sb0.IODS
 block_dict['NrMessages'] = sb0.NrMessages
 block_dict['MessageNr'] = sb0.MessageNr
 block_dict['PriorityCode'] = sb0.PriorityCode
 block_dict['dUDREI_In'] = sb0.dUDREI_In
 block_dict['dUDREI_Out'] = sb0.dUDREI_Out
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <GEOServiceLevel_ServiceRegion **>malloc( sb0.N * sizeof( GEOServiceLevel_ServiceRegion * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['ServiceRegion'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <GEOServiceLevel_ServiceRegion*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['Latitude1'] = sb1.Latitude1
  sb1_dict['Latitude2'] = sb1.Latitude2
  sb1_dict['Longitude1'] = sb1.Longitude1
  sb1_dict['Longitude2'] = sb1.Longitude2
  sb1_dict['RegionShape'] = sb1.RegionShape
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['GEOServiceLevel'] = GEOServiceLevel_toDict

def GEOClockEphCovMatrix_toDict(c1 *data):
 cdef GEOClockEphCovMatrix *sb0
 cdef GEOClockEphCovMatrix_CovMatrix *sb1
 cdef size_t i
 
 cdef GEOClockEphCovMatrix_CovMatrix **sb1s
 
 sb0 = <GEOClockEphCovMatrix *>data
 i = sizeof( GEOClockEphCovMatrix )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['PRN'] = sb0.PRN
 block_dict['IODP'] = sb0.IODP
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <GEOClockEphCovMatrix_CovMatrix **>malloc( sb0.N * sizeof( GEOClockEphCovMatrix_CovMatrix * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['CovMatrix'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <GEOClockEphCovMatrix_CovMatrix*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['PRNMaskNo'] = sb1.PRNMaskNo
  sb1_dict['ScaleExp'] = sb1.ScaleExp
  sb1_dict['E11'] = sb1.E11
  sb1_dict['E22'] = sb1.E22
  sb1_dict['E33'] = sb1.E33
  sb1_dict['E44'] = sb1.E44
  sb1_dict['E12'] = sb1.E12
  sb1_dict['E13'] = sb1.E13
  sb1_dict['E14'] = sb1.E14
  sb1_dict['E23'] = sb1.E23
  sb1_dict['E24'] = sb1.E24
  sb1_dict['E34'] = sb1.E34
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['GEOClockEphCovMatrix'] = GEOClockEphCovMatrix_toDict

def PVTCartesian_v2_toDict(c1 *data):
 cdef PVTCartesian_v2 *sb0
 sb0 = <PVTCartesian_v2 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['X'] = sb0.X
 block_dict['Y'] = sb0.Y
 block_dict['Z'] = sb0.Z
 block_dict['Undulation'] = sb0.Undulation
 block_dict['Vx'] = sb0.Vx
 block_dict['Vy'] = sb0.Vy
 block_dict['Vz'] = sb0.Vz
 block_dict['COG'] = sb0.COG
 block_dict['RxClkBias'] = sb0.RxClkBias
 block_dict['RxClkDrift'] = sb0.RxClkDrift
 block_dict['TimeSystem'] = sb0.TimeSystem
 block_dict['Datum'] = sb0.Datum
 block_dict['NrSV'] = sb0.NrSV
 block_dict['WACorrInfo'] = sb0.WACorrInfo
 block_dict['ReferenceID'] = sb0.ReferenceID
 block_dict['MeanCorrAge'] = sb0.MeanCorrAge
 block_dict['SignalInfo'] = sb0.SignalInfo
 block_dict['AlertFlag'] = sb0.AlertFlag
 block_dict['NrBases'] = sb0.NrBases

 return block_dict

BLOCKPARSERS['PVTCartesian_v2'] = PVTCartesian_v2_toDict

def PVTGeodetic_v2_toDict(c1 *data):
 cdef PVTGeodetic_v2 *sb0
 sb0 = <PVTGeodetic_v2 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Phi'] = sb0.Phi
 block_dict['Lambda'] = sb0.Lambda
 block_dict['h'] = sb0.h
 block_dict['Undulation'] = sb0.Undulation
 block_dict['Vn'] = sb0.Vn
 block_dict['Ve'] = sb0.Ve
 block_dict['Vu'] = sb0.Vu
 block_dict['COG'] = sb0.COG
 block_dict['RxClkBias'] = sb0.RxClkBias
 block_dict['RxClkDrift'] = sb0.RxClkDrift
 block_dict['TimeSystem'] = sb0.TimeSystem
 block_dict['Datum'] = sb0.Datum
 block_dict['NrSV'] = sb0.NrSV
 block_dict['WACorrInfo'] = sb0.WACorrInfo
 block_dict['ReferenceID'] = sb0.ReferenceID
 block_dict['MeanCorrAge'] = sb0.MeanCorrAge
 block_dict['SignalInfo'] = sb0.SignalInfo
 block_dict['AlertFlag'] = sb0.AlertFlag
 block_dict['NrBases'] = sb0.NrBases

 return block_dict

BLOCKPARSERS['PVTGeodetic_v2'] = PVTGeodetic_v2_toDict

def PosCovCartesian_toDict(c1 *data):
 cdef PosCovCartesian *sb0
 sb0 = <PosCovCartesian *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_xx'] = sb0.Cov_xx
 block_dict['Cov_yy'] = sb0.Cov_yy
 block_dict['Cov_zz'] = sb0.Cov_zz
 block_dict['Cov_bb'] = sb0.Cov_bb
 block_dict['Cov_xy'] = sb0.Cov_xy
 block_dict['Cov_xz'] = sb0.Cov_xz
 block_dict['Cov_xb'] = sb0.Cov_xb
 block_dict['Cov_yz'] = sb0.Cov_yz
 block_dict['Cov_yb'] = sb0.Cov_yb
 block_dict['Cov_zb'] = sb0.Cov_zb

 return block_dict

BLOCKPARSERS['PosCovCartesian'] = PosCovCartesian_toDict

def PosCovGeodetic_toDict(c1 *data):
 cdef PosCovGeodetic *sb0
 sb0 = <PosCovGeodetic *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_PhiPhi'] = sb0.Cov_PhiPhi
 block_dict['Cov_LambdaLambda'] = sb0.Cov_LambdaLambda
 block_dict['Cov_hh'] = sb0.Cov_hh
 block_dict['Cov_bb'] = sb0.Cov_bb
 block_dict['Cov_PhiLambda'] = sb0.Cov_PhiLambda
 block_dict['Cov_Phih'] = sb0.Cov_Phih
 block_dict['Cov_Phib'] = sb0.Cov_Phib
 block_dict['Cov_Lambdah'] = sb0.Cov_Lambdah
 block_dict['Cov_Lambdab'] = sb0.Cov_Lambdab
 block_dict['Cov_hb'] = sb0.Cov_hb

 return block_dict

BLOCKPARSERS['PosCovGeodetic'] = PosCovGeodetic_toDict

def VelCovCartesian_toDict(c1 *data):
 cdef VelCovCartesian *sb0
 sb0 = <VelCovCartesian *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_VxVx'] = sb0.Cov_VxVx
 block_dict['Cov_VyVy'] = sb0.Cov_VyVy
 block_dict['Cov_VzVz'] = sb0.Cov_VzVz
 block_dict['Cov_DtDt'] = sb0.Cov_DtDt
 block_dict['Cov_VxVy'] = sb0.Cov_VxVy
 block_dict['Cov_VxVz'] = sb0.Cov_VxVz
 block_dict['Cov_VxDt'] = sb0.Cov_VxDt
 block_dict['Cov_VyVz'] = sb0.Cov_VyVz
 block_dict['Cov_VyDt'] = sb0.Cov_VyDt
 block_dict['Cov_VzDt'] = sb0.Cov_VzDt

 return block_dict

BLOCKPARSERS['VelCovCartesian'] = VelCovCartesian_toDict

def VelCovGeodetic_toDict(c1 *data):
 cdef VelCovGeodetic *sb0
 sb0 = <VelCovGeodetic *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_VnVn'] = sb0.Cov_VnVn
 block_dict['Cov_VeVe'] = sb0.Cov_VeVe
 block_dict['Cov_VuVu'] = sb0.Cov_VuVu
 block_dict['Cov_DtDt'] = sb0.Cov_DtDt
 block_dict['Cov_VnVe'] = sb0.Cov_VnVe
 block_dict['Cov_VnVu'] = sb0.Cov_VnVu
 block_dict['Cov_VnDt'] = sb0.Cov_VnDt
 block_dict['Cov_VeVu'] = sb0.Cov_VeVu
 block_dict['Cov_VeDt'] = sb0.Cov_VeDt
 block_dict['Cov_VuDt'] = sb0.Cov_VuDt

 return block_dict

BLOCKPARSERS['VelCovGeodetic'] = VelCovGeodetic_toDict

def DOP_v2_toDict(c1 *data):
 cdef DOP_v2 *sb0
 sb0 = <DOP_v2 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['NrSV'] = sb0.NrSV
 block_dict['PDOP'] = sb0.PDOP
 block_dict['TDOP'] = sb0.TDOP
 block_dict['HDOP'] = sb0.HDOP
 block_dict['VDOP'] = sb0.VDOP
 block_dict['HPL'] = sb0.HPL
 block_dict['VPL'] = sb0.VPL

 return block_dict

BLOCKPARSERS['DOP_v2'] = DOP_v2_toDict

def PosCart_toDict(c1 *data):
 cdef PosCart *sb0
 sb0 = <PosCart *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['X'] = sb0.X
 block_dict['Y'] = sb0.Y
 block_dict['Z'] = sb0.Z
 block_dict['Base2RoverX'] = sb0.Base2RoverX
 block_dict['Base2RoverY'] = sb0.Base2RoverY
 block_dict['Base2RoverZ'] = sb0.Base2RoverZ
 block_dict['Cov_xx'] = sb0.Cov_xx
 block_dict['Cov_yy'] = sb0.Cov_yy
 block_dict['Cov_zz'] = sb0.Cov_zz
 block_dict['Cov_xy'] = sb0.Cov_xy
 block_dict['Cov_xz'] = sb0.Cov_xz
 block_dict['Cov_yz'] = sb0.Cov_yz
 block_dict['PDOP'] = sb0.PDOP
 block_dict['HDOP'] = sb0.HDOP
 block_dict['VDOP'] = sb0.VDOP
 block_dict['Misc'] = sb0.Misc
 block_dict['AlertFlag'] = sb0.AlertFlag
 block_dict['Datum'] = sb0.Datum
 block_dict['NrSV'] = sb0.NrSV
 block_dict['WACorrInfo'] = sb0.WACorrInfo
 block_dict['ReferenceID'] = sb0.ReferenceID
 block_dict['MeanCorrAge'] = sb0.MeanCorrAge
 block_dict['SignalInfo'] = sb0.SignalInfo

 return block_dict

BLOCKPARSERS['PosCart'] = PosCart_toDict

def PVTSatCartesian_toDict(c1 *data):
 cdef PVTSatCartesian *sb0
 cdef PVTSatCartesian_SatPos *sb1
 cdef size_t i
 
 cdef PVTSatCartesian_SatPos **sb1s
 
 sb0 = <PVTSatCartesian *>data
 i = sizeof( PVTSatCartesian )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <PVTSatCartesian_SatPos **>malloc( sb0.N * sizeof( PVTSatCartesian_SatPos * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['SatPos'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <PVTSatCartesian_SatPos*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['FreqNr'] = sb1.FreqNr
  sb1_dict['IODE'] = sb1.IODE
  sb1_dict['x'] = sb1.x
  sb1_dict['y'] = sb1.y
  sb1_dict['z'] = sb1.z
  sb1_dict['Vx'] = sb1.Vx
  sb1_dict['Vy'] = sb1.Vy
  sb1_dict['Vz'] = sb1.Vz
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['PVTSatCartesian'] = PVTSatCartesian_toDict

def PVTResiduals_v2_toDict(c1 *data):
 cdef PVTResiduals_v2 *sb0
 cdef PVTResiduals_v2_SatSignalInfo *sb1
 cdef PVTResiduals_v2_ResidualInfo *sb2
 cdef size_t i
 cdef i1 sb1_N2
 
 cdef PVTResiduals_v2_SatSignalInfo **sb1s
 cdef PVTResiduals_v2_ResidualInfo ***sb2s
 
 sb0 = <PVTResiduals_v2 *>data
 i = sizeof( PVTResiduals_v2 )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SB1Length'] = sb0.SB1Length
 block_dict['SB2Length'] = sb0.SB2Length

 
 sb1s = <PVTResiduals_v2_SatSignalInfo **>malloc( sb0.N * sizeof( PVTResiduals_v2_SatSignalInfo * ) )
 sb2s = <PVTResiduals_v2_ResidualInfo ***>malloc( sb0.N * sizeof( PVTResiduals_v2_SatSignalInfo * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['SatSignalInfo'] = sb1_list
 
 for n1 in xrange(sb0.N):
  sb1 = sb1s[n1] = <PVTResiduals_v2_SatSignalInfo*>(data + i)
  i += sb0.SB1Length
  sb1_dict = dict()
  sb1_list[n1] = sb1_dict
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['FreqNr'] = sb1.FreqNr
  sb1_dict['Type'] = sb1.Type
  sb1_dict['RefSVID'] = sb1.RefSVID
  sb1_dict['RefFreqNr'] = sb1.RefFreqNr
  sb1_dict['MeasInfo'] = sb1.MeasInfo
  sb1_dict['IODE'] = sb1.IODE
  sb1_dict['CorrAge'] = sb1.CorrAge
  sb1_dict['ReferenceID'] = sb1.ReferenceID

  
  sb1_N2 = 0
  if sb1.MeasInfo & (1 << 2):
   sb1_N2 += 1
  if sb1.MeasInfo & (1 << 3):
   sb1_N2 += 1
  if sb1.MeasInfo & (1 << 4):
   sb1_N2 += 1
   
  sb2s[n1] = <PVTResiduals_v2_ResidualInfo **>malloc( sb1_N2 * sizeof( PVTResiduals_v2_ResidualInfo * ) )
  sb2_list = [None] * sb1_N2
  sb1_dict['ResidualInfo'] = sb2_list
  
  for n2 in xrange(sb1_N2):
   sb2 = sb2s[n1][n2] = <PVTResiduals_v2_ResidualInfo*>(data + i)
   i += sb0.SB2Length
   sb2_dict = dict()
   sb2_list[n2] = sb2_dict
   sb2_dict['e_i'] = sb2.e_i
   sb2_dict['w_i'] = sb2.w_i
   sb2_dict['MDB'] = sb2.MDB

  free(sb2s[n1])
 free(sb2s)
 free(sb1s)
 return block_dict

BLOCKPARSERS['PVTResiduals_v2'] = PVTResiduals_v2_toDict

def RAIMStatistics_v2_toDict(c1 *data):
 cdef RAIMStatistics_v2 *sb0
 sb0 = <RAIMStatistics_v2 *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['IntegrityFlag'] = sb0.IntegrityFlag
 block_dict['HERL_position'] = sb0.HERL_position
 block_dict['VERL_position'] = sb0.VERL_position
 block_dict['HERL_velocity'] = sb0.HERL_velocity
 block_dict['VERL_velocity'] = sb0.VERL_velocity
 block_dict['OverallModel'] = sb0.OverallModel

 return block_dict

BLOCKPARSERS['RAIMStatistics_v2'] = RAIMStatistics_v2_toDict

def GEOCorrections_toDict(c1 *data):
 cdef GEOCorrections *sb0
 cdef GEOCorrections_SatCorr *sb1
 cdef size_t i
 
 cdef GEOCorrections_SatCorr **sb1s
 
 sb0 = <GEOCorrections *>data
 i = sizeof( GEOCorrections )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <GEOCorrections_SatCorr **>malloc( sb0.N * sizeof( GEOCorrections_SatCorr * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['SatCorr'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <GEOCorrections_SatCorr*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['IODE'] = sb1.IODE
  sb1_dict['PRC'] = sb1.PRC
  sb1_dict['CorrAgeFC'] = sb1.CorrAgeFC
  sb1_dict['DeltaX'] = sb1.DeltaX
  sb1_dict['DeltaY'] = sb1.DeltaY
  sb1_dict['DeltaZ'] = sb1.DeltaZ
  sb1_dict['DeltaClock'] = sb1.DeltaClock
  sb1_dict['CorrAgeLT'] = sb1.CorrAgeLT
  sb1_dict['IonoPPlat'] = sb1.IonoPPlat
  sb1_dict['IonoPPLon'] = sb1.IonoPPLon
  sb1_dict['SlantIono'] = sb1.SlantIono
  sb1_dict['CorrAgeIono'] = sb1.CorrAgeIono
  sb1_dict['VarFLT'] = sb1.VarFLT
  sb1_dict['VarUIRE'] = sb1.VarUIRE
  sb1_dict['VarAir'] = sb1.VarAir
  sb1_dict['VarTropo'] = sb1.VarTropo
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['GEOCorrections'] = GEOCorrections_toDict

def BaseVectorCart_toDict(c1 *data):
 cdef BaseVectorCart *sb0
 cdef BaseVectorCart_VectorInfoCart *sb1
 cdef size_t i
 
 cdef BaseVectorCart_VectorInfoCart **sb1s
 
 sb0 = <BaseVectorCart *>data
 i = sizeof( BaseVectorCart )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <BaseVectorCart_VectorInfoCart **>malloc( sb0.N * sizeof( BaseVectorCart_VectorInfoCart * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['VectorInfoCart'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <BaseVectorCart_VectorInfoCart*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['NrSV'] = sb1.NrSV
  sb1_dict['Error'] = sb1.Error
  sb1_dict['Mode'] = sb1.Mode
  sb1_dict['Misc'] = sb1.Misc
  sb1_dict['dX'] = sb1.dX
  sb1_dict['dY'] = sb1.dY
  sb1_dict['dZ'] = sb1.dZ
  sb1_dict['dVx'] = sb1.dVx
  sb1_dict['dVy'] = sb1.dVy
  sb1_dict['dVz'] = sb1.dVz
  sb1_dict['Azimuth'] = sb1.Azimuth
  sb1_dict['Elevation'] = sb1.Elevation
  sb1_dict['ReferenceID'] = sb1.ReferenceID
  sb1_dict['CorrAge'] = sb1.CorrAge
  sb1_dict['SignalInfo'] = sb1.SignalInfo
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['BaseVectorCart'] = BaseVectorCart_toDict

def BaseVectorGeod_toDict(c1 *data):
 cdef BaseVectorGeod *sb0
 cdef BaseVectorGeod_VectorInfoGeod *sb1
 cdef size_t i
 
 cdef BaseVectorGeod_VectorInfoGeod **sb1s
 
 sb0 = <BaseVectorGeod *>data
 i = sizeof( BaseVectorGeod )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <BaseVectorGeod_VectorInfoGeod **>malloc( sb0.N * sizeof( BaseVectorGeod_VectorInfoGeod * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['VectorInfoGeod'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <BaseVectorGeod_VectorInfoGeod*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['NrSV'] = sb1.NrSV
  sb1_dict['Error'] = sb1.Error
  sb1_dict['Mode'] = sb1.Mode
  sb1_dict['Misc'] = sb1.Misc
  sb1_dict['dEast'] = sb1.dEast
  sb1_dict['dNorth'] = sb1.dNorth
  sb1_dict['dUp'] = sb1.dUp
  sb1_dict['dVe'] = sb1.dVe
  sb1_dict['dVn'] = sb1.dVn
  sb1_dict['dVu'] = sb1.dVu
  sb1_dict['Azimuth'] = sb1.Azimuth
  sb1_dict['Elevation'] = sb1.Elevation
  sb1_dict['ReferenceID'] = sb1.ReferenceID
  sb1_dict['CorrAge'] = sb1.CorrAge
  sb1_dict['SignalInfo'] = sb1.SignalInfo
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['BaseVectorGeod'] = BaseVectorGeod_toDict

def PVTSupport_toDict(c1 *data):
 cdef PVTSupport *sb0
 sb0 = <PVTSupport *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc

 return block_dict

BLOCKPARSERS['PVTSupport'] = PVTSupport_toDict

def EndOfPVT_toDict(c1 *data):
 cdef EndOfPVT *sb0
 sb0 = <EndOfPVT *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc

 return block_dict

BLOCKPARSERS['EndOfPVT'] = EndOfPVT_toDict

def IntPVCart_toDict(c1 *data):
 cdef IntPVCart *sb0
 sb0 = <IntPVCart *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Info'] = sb0.Info
 block_dict['NrSV'] = sb0.NrSV
 block_dict['NrAnt'] = sb0.NrAnt
 block_dict['GNSSPVTMode'] = sb0.GNSSPVTMode
 block_dict['Datum'] = sb0.Datum
 block_dict['GNSSage'] = sb0.GNSSage
 block_dict['X'] = sb0.X
 block_dict['Y'] = sb0.Y
 block_dict['Z'] = sb0.Z
 block_dict['Vx'] = sb0.Vx
 block_dict['Vy'] = sb0.Vy
 block_dict['Vz'] = sb0.Vz
 block_dict['COG'] = sb0.COG

 return block_dict

BLOCKPARSERS['IntPVCart'] = IntPVCart_toDict

def IntPVGeod_toDict(c1 *data):
 cdef IntPVGeod *sb0
 sb0 = <IntPVGeod *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Info'] = sb0.Info
 block_dict['NrSV'] = sb0.NrSV
 block_dict['NrAnt'] = sb0.NrAnt
 block_dict['GNSSPVTMode'] = sb0.GNSSPVTMode
 block_dict['Datum'] = sb0.Datum
 block_dict['GNSSage'] = sb0.GNSSage
 block_dict['Lat'] = sb0.Lat
 block_dict['Long'] = sb0.Long
 block_dict['Alt'] = sb0.Alt
 block_dict['Vn'] = sb0.Vn
 block_dict['Ve'] = sb0.Ve
 block_dict['Vu'] = sb0.Vu
 block_dict['COG'] = sb0.COG

 return block_dict

BLOCKPARSERS['IntPVGeod'] = IntPVGeod_toDict

def IntPosCovCart_toDict(c1 *data):
 cdef IntPosCovCart *sb0
 sb0 = <IntPosCovCart *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_xx'] = sb0.Cov_xx
 block_dict['Cov_yy'] = sb0.Cov_yy
 block_dict['Cov_zz'] = sb0.Cov_zz
 block_dict['Cov_xy'] = sb0.Cov_xy
 block_dict['Cov_xz'] = sb0.Cov_xz
 block_dict['Cov_yz'] = sb0.Cov_yz

 return block_dict

BLOCKPARSERS['IntPosCovCart'] = IntPosCovCart_toDict

def IntVelCovCart_toDict(c1 *data):
 cdef IntVelCovCart *sb0
 sb0 = <IntVelCovCart *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_VxVx'] = sb0.Cov_VxVx
 block_dict['Cov_VyVy'] = sb0.Cov_VyVy
 block_dict['Cov_VzVz'] = sb0.Cov_VzVz
 block_dict['Cov_VxVy'] = sb0.Cov_VxVy
 block_dict['Cov_VxVz'] = sb0.Cov_VxVz
 block_dict['Cov_VyVz'] = sb0.Cov_VyVz

 return block_dict

BLOCKPARSERS['IntVelCovCart'] = IntVelCovCart_toDict

def IntPosCovGeod_toDict(c1 *data):
 cdef IntPosCovGeod *sb0
 sb0 = <IntPosCovGeod *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_LatLat'] = sb0.Cov_LatLat
 block_dict['Cov_LonLon'] = sb0.Cov_LonLon
 block_dict['Cov_AltAlt'] = sb0.Cov_AltAlt
 block_dict['Cov_LatLon'] = sb0.Cov_LatLon
 block_dict['Cov_LatAlt'] = sb0.Cov_LatAlt
 block_dict['Cov_LonAlt'] = sb0.Cov_LonAlt

 return block_dict

BLOCKPARSERS['IntPosCovGeod'] = IntPosCovGeod_toDict

def IntVelCovGeod_toDict(c1 *data):
 cdef IntVelCovGeod *sb0
 sb0 = <IntVelCovGeod *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_VnVn'] = sb0.Cov_VnVn
 block_dict['Cov_VeVe'] = sb0.Cov_VeVe
 block_dict['Cov_VuVu'] = sb0.Cov_VuVu
 block_dict['Cov_VnVe'] = sb0.Cov_VnVe
 block_dict['Cov_VnVu'] = sb0.Cov_VnVu
 block_dict['Cov_VeVu'] = sb0.Cov_VeVu

 return block_dict

BLOCKPARSERS['IntVelCovGeod'] = IntVelCovGeod_toDict

def IntAttEuler_toDict(c1 *data):
 cdef IntAttEuler *sb0
 sb0 = <IntAttEuler *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Info'] = sb0.Info
 block_dict['NrSV'] = sb0.NrSV
 block_dict['NrAnt'] = sb0.NrAnt
 block_dict['Datum'] = sb0.Datum
 block_dict['GNSSage'] = sb0.GNSSage
 block_dict['Heading'] = sb0.Heading
 block_dict['Pitch'] = sb0.Pitch
 block_dict['Roll'] = sb0.Roll
 block_dict['PitchDot'] = sb0.PitchDot
 block_dict['RollDot'] = sb0.RollDot
 block_dict['HeadingDot'] = sb0.HeadingDot

 return block_dict

BLOCKPARSERS['IntAttEuler'] = IntAttEuler_toDict

def IntAttCovEuler_toDict(c1 *data):
 cdef IntAttCovEuler *sb0
 sb0 = <IntAttCovEuler *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Cov_HeadHead'] = sb0.Cov_HeadHead
 block_dict['Cov_PitchPitch'] = sb0.Cov_PitchPitch
 block_dict['Cov_RollRoll'] = sb0.Cov_RollRoll
 block_dict['Cov_HeadPitch'] = sb0.Cov_HeadPitch
 block_dict['Cov_HeadRoll'] = sb0.Cov_HeadRoll
 block_dict['Cov_PitchRoll'] = sb0.Cov_PitchRoll

 return block_dict

BLOCKPARSERS['IntAttCovEuler'] = IntAttCovEuler_toDict

def IntPVAAGeod_toDict(c1 *data):
 cdef IntPVAAGeod *sb0
 sb0 = <IntPVAAGeod *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Info'] = sb0.Info
 block_dict['GNSSPVTMode'] = sb0.GNSSPVTMode
 block_dict['Datum'] = sb0.Datum
 block_dict['GNSSage'] = sb0.GNSSage
 block_dict['NrSVAnt'] = sb0.NrSVAnt
 block_dict['PosFine'] = sb0.PosFine
 block_dict['Lat'] = sb0.Lat
 block_dict['Long'] = sb0.Long
 block_dict['Alt'] = sb0.Alt
 block_dict['Vn'] = sb0.Vn
 block_dict['Ve'] = sb0.Ve
 block_dict['Vu'] = sb0.Vu
 block_dict['Ax'] = sb0.Ax
 block_dict['Ay'] = sb0.Ay
 block_dict['Az'] = sb0.Az
 block_dict['Heading'] = sb0.Heading
 block_dict['Pitch'] = sb0.Pitch
 block_dict['Roll'] = sb0.Roll

 return block_dict

BLOCKPARSERS['IntPVAAGeod'] = IntPVAAGeod_toDict

def AuxAntPositions_toDict(c1 *data):
 cdef AuxAntPositions *sb0
 cdef AuxAntPositions_AuxAntPosition *sb1
 cdef size_t i
 
 cdef AuxAntPositions_AuxAntPosition **sb1s
 
 sb0 = <AuxAntPositions *>data
 i = sizeof( AuxAntPositions )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <AuxAntPositions_AuxAntPosition **>malloc( sb0.N * sizeof( AuxAntPositions_AuxAntPosition * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['AuxAntPosition'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <AuxAntPositions_AuxAntPosition*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['NrSV'] = sb1.NrSV
  sb1_dict['Error'] = sb1.Error
  sb1_dict['AmbiguityType'] = sb1.AmbiguityType
  sb1_dict['AuxAntID'] = sb1.AuxAntID
  sb1_dict['dEast'] = sb1.dEast
  sb1_dict['dNorth'] = sb1.dNorth
  sb1_dict['dUp'] = sb1.dUp
  sb1_dict['EastVel'] = sb1.EastVel
  sb1_dict['NorthVel'] = sb1.NorthVel
  sb1_dict['UpVel'] = sb1.UpVel
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['AuxAntPositions'] = AuxAntPositions_toDict

def AttEuler_toDict(c1 *data):
 cdef AttEuler *sb0
 sb0 = <AttEuler *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['NrSV'] = sb0.NrSV
 block_dict['Error'] = sb0.Error
 block_dict['Mode'] = sb0.Mode
 block_dict['Datum'] = sb0.Datum
 block_dict['Heading'] = sb0.Heading
 block_dict['Pitch'] = sb0.Pitch
 block_dict['Roll'] = sb0.Roll
 block_dict['PitchDot'] = sb0.PitchDot
 block_dict['RollDot'] = sb0.RollDot
 block_dict['HeadingDot'] = sb0.HeadingDot

 return block_dict

BLOCKPARSERS['AttEuler'] = AttEuler_toDict

def AttCovEuler_toDict(c1 *data):
 cdef AttCovEuler *sb0
 sb0 = <AttCovEuler *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Error'] = sb0.Error
 block_dict['Cov_HeadHead'] = sb0.Cov_HeadHead
 block_dict['Cov_PitchPitch'] = sb0.Cov_PitchPitch
 block_dict['Cov_RollRoll'] = sb0.Cov_RollRoll
 block_dict['Cov_HeadPitch'] = sb0.Cov_HeadPitch
 block_dict['Cov_HeadRoll'] = sb0.Cov_HeadRoll
 block_dict['Cov_PitchRoll'] = sb0.Cov_PitchRoll

 return block_dict

BLOCKPARSERS['AttCovEuler'] = AttCovEuler_toDict

def EndOfAtt_toDict(c1 *data):
 cdef EndOfAtt *sb0
 sb0 = <EndOfAtt *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc

 return block_dict

BLOCKPARSERS['EndOfAtt'] = EndOfAtt_toDict

def ReceiverTime_toDict(c1 *data):
 cdef ReceiverTime *sb0
 sb0 = <ReceiverTime *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['UTCYear'] = sb0.UTCYear
 block_dict['UTCMonth'] = sb0.UTCMonth
 block_dict['UTCDay'] = sb0.UTCDay
 block_dict['UTCHour'] = sb0.UTCHour
 block_dict['UTCMin'] = sb0.UTCMin
 block_dict['UTCSec'] = sb0.UTCSec
 block_dict['DeltaLS'] = sb0.DeltaLS
 block_dict['SyncLevel'] = sb0.SyncLevel

 return block_dict

BLOCKPARSERS['ReceiverTime'] = ReceiverTime_toDict

def xPPSOffset_toDict(c1 *data):
 cdef xPPSOffset *sb0
 sb0 = <xPPSOffset *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['SyncAge'] = sb0.SyncAge
 block_dict['Timescale'] = sb0.Timescale
 block_dict['Offset'] = sb0.Offset

 return block_dict

BLOCKPARSERS['xPPSOffset'] = xPPSOffset_toDict

def ExtEvent_toDict(c1 *data):
 cdef ExtEvent *sb0
 sb0 = <ExtEvent *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Source'] = sb0.Source
 block_dict['Polarity'] = sb0.Polarity
 block_dict['Offset'] = sb0.Offset
 block_dict['RxClkBias'] = sb0.RxClkBias
 block_dict['PVTAge'] = sb0.PVTAge

 return block_dict

BLOCKPARSERS['ExtEvent'] = ExtEvent_toDict

def ExtEventPVTCartesian_toDict(c1 *data):
 cdef ExtEventPVTCartesian *sb0
 sb0 = <ExtEventPVTCartesian *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['X'] = sb0.X
 block_dict['Y'] = sb0.Y
 block_dict['Z'] = sb0.Z
 block_dict['Undulation'] = sb0.Undulation
 block_dict['Vx'] = sb0.Vx
 block_dict['Vy'] = sb0.Vy
 block_dict['Vz'] = sb0.Vz
 block_dict['COG'] = sb0.COG
 block_dict['RxClkBias'] = sb0.RxClkBias
 block_dict['RxClkDrift'] = sb0.RxClkDrift
 block_dict['TimeSystem'] = sb0.TimeSystem
 block_dict['Datum'] = sb0.Datum
 block_dict['NrSV'] = sb0.NrSV
 block_dict['WACorrInfo'] = sb0.WACorrInfo
 block_dict['ReferenceID'] = sb0.ReferenceID
 block_dict['MeanCorrAge'] = sb0.MeanCorrAge
 block_dict['SignalInfo'] = sb0.SignalInfo
 block_dict['AlertFlag'] = sb0.AlertFlag
 block_dict['NrBases'] = sb0.NrBases

 return block_dict

BLOCKPARSERS['ExtEventPVTCartesian'] = ExtEventPVTCartesian_toDict

def ExtEventPVTGeodetic_toDict(c1 *data):
 cdef ExtEventPVTGeodetic *sb0
 sb0 = <ExtEventPVTGeodetic *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Error'] = sb0.Error
 block_dict['Phi'] = sb0.Phi
 block_dict['Lambda'] = sb0.Lambda
 block_dict['h'] = sb0.h
 block_dict['Undulation'] = sb0.Undulation
 block_dict['Vn'] = sb0.Vn
 block_dict['Ve'] = sb0.Ve
 block_dict['Vu'] = sb0.Vu
 block_dict['COG'] = sb0.COG
 block_dict['RxClkBias'] = sb0.RxClkBias
 block_dict['RxClkDrift'] = sb0.RxClkDrift
 block_dict['TimeSystem'] = sb0.TimeSystem
 block_dict['Datum'] = sb0.Datum
 block_dict['NrSV'] = sb0.NrSV
 block_dict['WACorrInfo'] = sb0.WACorrInfo
 block_dict['ReferenceID'] = sb0.ReferenceID
 block_dict['MeanCorrAge'] = sb0.MeanCorrAge
 block_dict['SignalInfo'] = sb0.SignalInfo
 block_dict['AlertFlag'] = sb0.AlertFlag
 block_dict['NrBases'] = sb0.NrBases

 return block_dict

BLOCKPARSERS['ExtEventPVTGeodetic'] = ExtEventPVTGeodetic_toDict

def DiffCorrIn_toDict(c1 *data):
 cdef DiffCorrIn *sb0
 sb0 = <DiffCorrIn *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Mode'] = sb0.Mode
 block_dict['Source'] = sb0.Source
 block_dict['MessageContent'] = <c1*>&sb0.MessageContent

 return block_dict

BLOCKPARSERS['DiffCorrIn'] = DiffCorrIn_toDict

def BaseStation_toDict(c1 *data):
 cdef BaseStation *sb0
 sb0 = <BaseStation *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['BaseStationID'] = sb0.BaseStationID
 block_dict['BaseType'] = sb0.BaseType
 block_dict['Source'] = sb0.Source
 block_dict['Datum'] = sb0.Datum
 block_dict['X'] = sb0.X
 block_dict['Y'] = sb0.Y
 block_dict['Z'] = sb0.Z

 return block_dict

BLOCKPARSERS['BaseStation'] = BaseStation_toDict

def LBandTrackerStatus_toDict(c1 *data):
 cdef LBandTrackerStatus *sb0
 cdef LBandTrackerStatus_TrackData *sb1
 cdef size_t i
 
 cdef LBandTrackerStatus_TrackData **sb1s
 
 sb0 = <LBandTrackerStatus *>data
 i = sizeof( LBandTrackerStatus )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <LBandTrackerStatus_TrackData **>malloc( sb0.N * sizeof( LBandTrackerStatus_TrackData * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['TrackData'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <LBandTrackerStatus_TrackData*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['Frequency'] = sb1.Frequency
  sb1_dict['Baudrate'] = sb1.Baudrate
  sb1_dict['ServiceID'] = sb1.ServiceID
  sb1_dict['FreqOffset'] = sb1.FreqOffset
  sb1_dict['CN0'] = sb1.CN0
  sb1_dict['AvgPower'] = sb1.AvgPower
  sb1_dict['AGCGain'] = sb1.AGCGain
  sb1_dict['Mode'] = sb1.Mode
  sb1_dict['Status'] = sb1.Status
  sb1_dict['LockTime'] = sb1.LockTime
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['LBandTrackerStatus'] = LBandTrackerStatus_toDict

def DecoderStatus_toDict(c1 *data):
 cdef DecoderStatus *sb0
 sb0 = <DecoderStatus *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Status'] = sb0.Status
 block_dict['Access'] = sb0.Access
 block_dict['GeoGatingMode'] = sb0.GeoGatingMode
 block_dict['GeoGatingStatus'] = sb0.GeoGatingStatus
 block_dict['Event'] = sb0.Event

 return block_dict

BLOCKPARSERS['DecoderStatus'] = DecoderStatus_toDict

def LBAS1Messages_toDict(c1 *data):
 cdef LBAS1Messages *sb0
 sb0 = <LBAS1Messages *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['MessageLength'] = sb0.MessageLength

 block_dict['Message'] = (<c1*>&sb0.Message)[0:sb0.MessageLength]
 
 return block_dict

BLOCKPARSERS['LBAS1Messages'] = LBAS1Messages_toDict

def ExtSensorMeas_toDict(c1 *data):
 cdef ExtSensorMeas *sb0
 cdef ExtSensorMeas_MeasSet *sb1
 cdef size_t i
 
 cdef ExtSensorMeas_MeasSet **sb1s
 
 sb0 = <ExtSensorMeas *>data
 i = sizeof( ExtSensorMeas )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <ExtSensorMeas_MeasSet **>malloc( sb0.N * sizeof( ExtSensorMeas_MeasSet * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['MeasSet'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <ExtSensorMeas_MeasSet*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['Source'] = sb1.Source
  sb1_dict['SensorModel'] = sb1.SensorModel
  sb1_dict['Type'] = sb1.Type
  sb1_dict['ObsInfo'] = sb1.ObsInfo
  sb1_dict['X'] = sb1.X
  sb1_dict['Y'] = sb1.Y
  sb1_dict['Z'] = sb1.Z
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['ExtSensorMeas'] = ExtSensorMeas_toDict

def ExtSensorStatus_toDict(c1 *data):
 cdef ExtSensorStatus *sb0
 sb0 = <ExtSensorStatus *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['Source'] = sb0.Source
 block_dict['SensorModel'] = sb0.SensorModel
 block_dict['StatusType'] = sb0.StatusType

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
 
 return block_dict

BLOCKPARSERS['ExtSensorStatus'] = ExtSensorStatus_toDict

def ExtSensorSetup_toDict(c1 *data):
 cdef ExtSensorSetup *sb0
 cdef ExtSensorSetup_OneSensor *sb1
 cdef size_t i
 
 cdef ExtSensorSetup_OneSensor **sb1s
 
 sb0 = <ExtSensorSetup *>data
 i = sizeof( ExtSensorSetup )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <ExtSensorSetup_OneSensor **>malloc( sb0.N * sizeof( ExtSensorSetup_OneSensor * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['OneSensor'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <ExtSensorSetup_OneSensor*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['Source'] = sb1.Source
  sb1_dict['SensorModel'] = sb1.SensorModel
  sb1_dict['MeasType'] = sb1.MeasType
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['ExtSensorSetup'] = ExtSensorSetup_toDict

def ChannelStatus_toDict(c1 *data):
 cdef ChannelStatus *sb0
 cdef ChannelStatus_ChannelSatInfo *sb1
 cdef ChannelStatus_ChannelStateInfo *sb2
 cdef size_t i
 
 cdef ChannelStatus_ChannelSatInfo **sb1s
 cdef ChannelStatus_ChannelStateInfo ***sb2s
 
 sb0 = <ChannelStatus *>data
 i = sizeof( ChannelStatus )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N1'] = sb0.N1
 block_dict['SB1Length'] = sb0.SB1Length
 block_dict['SB2Length'] = sb0.SB2Length

 
 sb1s = <ChannelStatus_ChannelSatInfo **>malloc( sb0.N1 * sizeof( ChannelStatus_ChannelSatInfo * ) )
 sb2s = <ChannelStatus_ChannelStateInfo ***>malloc( sb0.N1 * sizeof( ChannelStatus_ChannelSatInfo * ) )
 
 sb1_list = [None] * sb0.N1
 block_dict['ChannelSatInfo'] = sb1_list
 
 for n1 in xrange(sb0.N1):
  sb1 = sb1s[n1] = <ChannelStatus_ChannelSatInfo*>(data + i)
  i += sb0.SB1Length
  sb1_dict = dict()
  sb1_list[n1] = sb1_dict
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['FreqNr'] = sb1.FreqNr
  sb1_dict['Azimuth_RiseSet'] = sb1.Azimuth_RiseSet
  sb1_dict['HealthStaus'] = sb1.HealthStaus
  sb1_dict['Elevation'] = sb1.Elevation
  sb1_dict['N2'] = sb1.N2
  sb1_dict['RxChannel'] = sb1.RxChannel

  
  sb2s[n1] = <ChannelStatus_ChannelStateInfo **>malloc( sb1.N2 * sizeof( ChannelStatus_ChannelStateInfo * ) )
  sb2_list = [None] * sb1.N2
  sb1_dict['ChannelStateInfo'] = sb2_list
  
  for n2 in xrange(sb1.N2):
   sb2 = sb2s[n1][n2] = <ChannelStatus_ChannelStateInfo*>(data + i)
   i += sb0.SB2Length
   sb2_dict = dict()
   sb2_list[n2] = sb2_dict
   sb2_dict['Antenna'] = sb2.Antenna
   sb2_dict['TrackingStatus'] = sb2.TrackingStatus
   sb2_dict['PVTStatus'] = sb2.PVTStatus
   sb2_dict['PVTInfo'] = sb2.PVTInfo

  free(sb2s[n1])
 free(sb2s)
 free(sb1s)
 return block_dict

BLOCKPARSERS['ChannelStatus'] = ChannelStatus_toDict

def ReceiverStatus_v2_toDict(c1 *data):
 cdef ReceiverStatus_v2 *sb0
 cdef ReceiverStatus_v2_AGCData *sb1
 cdef size_t i
 
 cdef ReceiverStatus_v2_AGCData **sb1s
 
 sb0 = <ReceiverStatus_v2 *>data
 i = sizeof( ReceiverStatus_v2 )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['CPULoad'] = sb0.CPULoad
 block_dict['ExtError'] = sb0.ExtError
 block_dict['UpTime'] = sb0.UpTime
 block_dict['RxState'] = sb0.RxState
 block_dict['RxError'] = sb0.RxError
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <ReceiverStatus_v2_AGCData **>malloc( sb0.N * sizeof( ReceiverStatus_v2_AGCData * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['AGCData'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <ReceiverStatus_v2_AGCData*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['FrontendID'] = sb1.FrontendID
  sb1_dict['Gain'] = sb1.Gain
  sb1_dict['SampleVar'] = sb1.SampleVar
  sb1_dict['BlankingStat'] = sb1.BlankingStat
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['ReceiverStatus_v2'] = ReceiverStatus_v2_toDict

def SatVisibility_toDict(c1 *data):
 cdef SatVisibility *sb0
 cdef SatVisibility_SatInfo *sb1
 cdef size_t i
 
 cdef SatVisibility_SatInfo **sb1s
 
 sb0 = <SatVisibility *>data
 i = sizeof( SatVisibility )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <SatVisibility_SatInfo **>malloc( sb0.N * sizeof( SatVisibility_SatInfo * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['SatInfo'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <SatVisibility_SatInfo*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['SVID'] = sb1.SVID
  sb1_dict['FreqNr'] = sb1.FreqNr
  sb1_dict['Azimuth'] = sb1.Azimuth
  sb1_dict['Elevation'] = sb1.Elevation
  sb1_dict['RiseSet'] = sb1.RiseSet
  sb1_dict['SatelliteInfo'] = sb1.SatelliteInfo
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['SatVisibility'] = SatVisibility_toDict

def InputLink_toDict(c1 *data):
 cdef InputLink *sb0
 cdef InputLink_InputStats *sb1
 cdef size_t i
 
 cdef InputLink_InputStats **sb1s
 
 sb0 = <InputLink *>data
 i = sizeof( InputLink )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['SBLength'] = sb0.SBLength

 
 sb1s = <InputLink_InputStats **>malloc( sb0.N * sizeof( InputLink_InputStats * ) )
 
 sb1_list = [None] * sb0.N
 block_dict['InputStats'] = sb1_list
 
 for n in xrange(sb0.N):
  sb1 = sb1s[n] = <InputLink_InputStats*>(data + i)
  i += sb0.SBLength
  sb1_dict = dict()
  sb1_list[n] = sb1_dict
  sb1_dict['CD'] = sb1.CD
  sb1_dict['Type'] = sb1.Type
  sb1_dict['AgeOfLastMessage'] = sb1.AgeOfLastMessage
  sb1_dict['NrBytesReceived'] = sb1.NrBytesReceived
  sb1_dict['NrBytesAccepted'] = sb1.NrBytesAccepted
  sb1_dict['NrMsgReceived'] = sb1.NrMsgReceived
  sb1_dict['NrMsgAccepted'] = sb1.NrMsgAccepted
 
 free(sb1s)
 return block_dict

BLOCKPARSERS['InputLink'] = InputLink_toDict

def OutputLink_toDict(c1 *data):
 cdef OutputLink *sb0
 cdef OutputLink_OutputStats *sb1
 cdef OutputLink_OutputType *sb2
 cdef size_t i
 
 cdef OutputLink_OutputStats **sb1s
 cdef OutputLink_OutputType ***sb2s
 
 sb0 = <OutputLink *>data
 i = sizeof( OutputLink )
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N1'] = sb0.N1
 block_dict['SB1Length'] = sb0.SB1Length
 block_dict['SB2Length'] = sb0.SB2Length

 
 sb1s = <OutputLink_OutputStats **>malloc( sb0.N1 * sizeof( OutputLink_OutputStats * ) )
 sb2s = <OutputLink_OutputType ***>malloc( sb0.N1 * sizeof( OutputLink_OutputStats * ) )
 
 sb1_list = [None] * sb0.N1
 block_dict['OutputStats'] = sb1_list
 
 for n1 in xrange(sb0.N1):
  sb1 = sb1s[n1] = <OutputLink_OutputStats*>(data + i)
  i += sb0.SB1Length
  sb1_dict = dict()
  sb1_list[n1] = sb1_dict
  sb1_dict['CD'] = sb1.CD
  sb1_dict['N2'] = sb1.N2
  sb1_dict['AllowedRate'] = sb1.AllowedRate
  sb1_dict['NrBytesProduced'] = sb1.NrBytesProduced
  sb1_dict['NrBytesSent'] = sb1.NrBytesSent
  sb1_dict['NrClients'] = sb1.NrClients

  
  sb2s[n1] = <OutputLink_OutputType **>malloc( sb1.N2 * sizeof( OutputLink_OutputType * ) )
  sb2_list = [None] * sb1.N2
  sb1_dict['OutputType'] = sb2_list
  
  for n2 in xrange(sb1.N2):
   sb2 = sb2s[n1][n2] = <OutputLink_OutputType*>(data + i)
   i += sb0.SB2Length
   sb2_dict = dict()
   sb2_list[n2] = sb2_dict
   sb2_dict['Type'] = sb2.Type
   sb2_dict['Percentage'] = sb2.Percentage

  free(sb2s[n1])
 free(sb2s)
 free(sb1s)
 return block_dict

BLOCKPARSERS['OutputLink'] = OutputLink_toDict

def IPStatus_toDict(c1 *data):
 cdef IPStatus *sb0
 sb0 = <IPStatus *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['MACAddress'] = (<c1*>sb0.MACAddress)[0:6]
 block_dict['IPAddress'] = (<c1*>sb0.IPAddress)[0:16]
 block_dict['Gateway'] = (<c1*>sb0.Gateway)[0:16]
 block_dict['Netmask'] = sb0.Netmask

 return block_dict

BLOCKPARSERS['IPStatus'] = IPStatus_toDict

def ReceiverSetup_toDict(c1 *data):
 cdef ReceiverSetup *sb0
 sb0 = <ReceiverSetup *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['MarkerName'] = (<c1*>sb0.MarkerName)[0:60]
 block_dict['MarkerNumber'] = (<c1*>sb0.MarkerNumber)[0:20]
 block_dict['Observer'] = (<c1*>sb0.Observer)[0:20]
 block_dict['Agency'] = (<c1*>sb0.Agency)[0:40]
 block_dict['RxSerialNumber'] = (<c1*>sb0.RxSerialNumber)[0:20]
 block_dict['RxName'] = (<c1*>sb0.RxName)[0:20]
 block_dict['RxVersion'] = (<c1*>sb0.RxVersion)[0:20]
 block_dict['AntSerialNbr'] = (<c1*>sb0.AntSerialNbr)[0:20]
 block_dict['AntType'] = (<c1*>sb0.AntType)[0:20]
 block_dict['DeltaH'] = sb0.DeltaH
 block_dict['DeltaE'] = sb0.DeltaE
 block_dict['DeltaN'] = sb0.DeltaN
 block_dict['MarkerType'] = (<c1*>sb0.MarkerType)[0:20]
 block_dict['GNSSFWVersion'] = (<c1*>sb0.GNSSFWVersion)[0:40]
 block_dict['ProductName'] = (<c1*>sb0.ProductName)[0:40]

 return block_dict

BLOCKPARSERS['ReceiverSetup'] = ReceiverSetup_toDict

def Commands_toDict(c1 *data):
 cdef Commands *sb0
 sb0 = <Commands *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['CmdData'] = <c1*>&sb0.CmdData

 return block_dict

BLOCKPARSERS['Commands'] = Commands_toDict

def Comment_toDict(c1 *data):
 cdef Comment *sb0
 sb0 = <Comment *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['CommentLn'] = sb0.CommentLn

 block_dict['Comment'] = (<c1*>&sb0.Comment)[0:sb0.CommentLn]
 
 return block_dict

BLOCKPARSERS['Comment'] = Comment_toDict

def BBSamples_toDict(c1 *data):
 cdef BBSamples *sb0
 sb0 = <BBSamples *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['N'] = sb0.N
 block_dict['Info'] = sb0.Info
 block_dict['SampleFreq'] = sb0.SampleFreq
 block_dict['LOFreq'] = sb0.LOFreq

 block_dict['Samples'] = (<c1*>&sb0.Samples)[0:2*sb0.N]
 
 return block_dict

BLOCKPARSERS['BBSamples'] = BBSamples_toDict

def ASCIIIn_toDict(c1 *data):
 cdef ASCIIIn *sb0
 sb0 = <ASCIIIn *>data
 
 block_dict = dict()
 block_dict['TOW'] = sb0.TOW
 block_dict['WNc'] = sb0.WNc
 block_dict['CD'] = sb0.CD
 block_dict['StringLn'] = sb0.StringLn

 block_dict['ASCIIString'] = (<c1*>&sb0.ASCIIString)[0:sb0.StringLn]
 
 return block_dict

BLOCKPARSERS['ASCIIIn'] = ASCIIIn_toDict
