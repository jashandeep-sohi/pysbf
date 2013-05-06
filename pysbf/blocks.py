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

BLOCKNUMBERS = [
 5889, 5890, 5944,
 4027, 4000, 4046, 
 5922, 5895, 5947,
 5898, 4017, 4018,
 4019, 4026, 4022,
 4023, 4024, 4020,
 4047, 4066, 4067,
 4068, 5891, 5892,
 5893, 5894, 4004,
 4005, 4036, 4002,
 4003, 4030, 4031,
 4032, 4034, 5925,
 5926, 5927, 5928,
 5929, 5896, 5930,
 5918, 5897, 5931,
 5932, 5933, 5917,
 5934, 5903, 5904,
 5909, 5910, 5915,
 4006, 4007, 5905,
 5906, 5907, 5908,
 4001, 4044, 4008,
 4009, 4011, 5935,
 4043, 4028, 4076,
 5921, 4060, 4061,
 4062, 4063, 4064,
 4065, 4070, 4072,
 4045, 5938, 5939,
 5943, 5942, 5914,
 5911, 5924, 4037,
 4038, 5919, 5949,
 4201, 4202, 4203,
 4050, 4056, 4057,
 5913, 5912, 4013,
 4014, 4012, 4090,
 4091, 4058, 5902,
 4015, 5936, 4040,
 4075, 
]

BLOCKNAMES = [
 'MeasEpoch',            'ShortMeasEpoch',     'GenMeasEpoch', 
 'MeasEpoch_v2',         'MeasExtra',          'IQCorr', 
 'EndOfMeas',            'GPSRaw',             'CNAVRaw',
 'GEORaw',               'GPSRawCA',           'GPSRawL2C', 
 'GPSRawL5',             'GLORawCA',           'GALRawFNAV', 
 'GALRawINAV',           'GALRawCNAV',         'GEORawL1',
 'CMPRaw',               'QZSRawL1CA',         'QZSRawL2C', 
 'QZSRawL5',             'GPSNav',             'GPSAlm', 
 'GPSIon',               'GPSUtc',             'GLONav', 
 'GLOAlm',               'GLOTime',            'GALNav', 
 'GALAlm',               'GALIon',             'GALUtc',
 'GALGstGps',            'GALSARRLM',          'GEOMT00', 
 'GEOPRNMask',           'GEOFastCorr',        'GEOIntegrity', 
 'GEOFastCorrDegr',      'GEONav',             'GEODegrFactors', 
 'GEONetworkTime',       'GEOAlm',             'GEOIGPMask',
 'GEOLongTermCor',       'GEOIonoDelay',       'GEOServiceLevel',
 'GEOClockEphCovMatrix', 'PVTCartesian',       'PVTGeodetic',
 'DOP',                  'PVTResiduals',       'RAIMStatistics', 
 'PVTCartesian_v2',      'PVTGeodetic_v2',     'PosCovCartesian', 
 'PosCovGeodetic',       'VelCovCartesian',    'VelCovGeodetic', 
 'DOP_v2',               'PosCart',            'PVTSatCartesian', 
 'PVTResiduals_v2',      'RAIMStatistics_v2',  'GEOCorrections', 
 'BaseVectorCart',       'BaseVectorGeod',     'PVTSupport', 
 'EndOfPVT',             'IntPVCart',          'IntPVGeod',
 'IntPosCovCart',        'IntVelCovCart',      'IntPosCovGeod',
 'IntVelCovGeod',        'IntAttEuler',        'IntAttCovEuler',
 'IntPVAAGeod',          'AttEuler',           'AttCovEuler', 
 'EndOfAtt',             'AuxAntPositions',    'ReceiverTime', 
 'xPPSOffset',           'ExtEvent',           'ExtEventPVTCartesian', 
 'ExtEventPVTGeodetic',  'DiffCorrIn',         'BaseStation', 
 'LBandTrackerStatus',   'LBAS1DecoderStatus', 'LBAS1Messages', 
 'ExtSensorMeas',        'ExtSensorStatus',    'ExtSensorSetup', 
 'ReceiverStatus',       'TrackingStatus',     'ChannelStatus', 
 'ReceiverStatus_v2',    'SatVisibility',      'InputLink', 
 'OutputLink',           'IPStatus',           'ReceiverSetup',
 'Commands',             'Comment',            'BBSamples', 
 'ASCIIIn', 
]

MeasEpoch_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N1', 'u1'),
 ('SB1Length', 'u1'),
 ('SB2Length', 'u1'),
 ('CommonFlags', 'u1'),
 ('CumClkJumps', 'i1'),
 ('Reserved', 'u1'),
)

MeasEpoch_v2_Type_1 = (
 ('RxChannel', 'u1'),
 ('Type', 'u1'),
 ('SVID', 'u1'),
 ('Misc', 'u1'),
 ('CodeLSB', 'u4'),
 ('Doppler', 'i4'),
 ('CarrierLSB', 'u2'),
 ('CarrierMSB', 'i1'),
 ('CN0', 'u1'),
 ('LockTime', 'u2'),
 ('ObsInfo', 'u1'),
 ('N2', 'u1'),
)

MeasEpoch_v2_Type_2 = (
 ('Type', 'u1'),
 ('LockTime', 'u1'),
 ('CN0', 'u1'),
 ('OffsetMSB', 'u1'),
 ('CarrierMSB', 'i1'),
 ('ObsInfo', 'u1'),
 ('CodeOffsetLSB', 'u2'),
 ('CarrierLSB', 'u2'),
 ('DopplerOffsetLSB', 'u2'),
)

MeasExtra = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
 ('DopplerVarFactor', 'f4'),
)

MeasExtra_MeasExtraChannel = (
 ('RxChannel', 'u1'),
 ('Type', 'u1'),
 ('MPCorrection ', 'i2'),
 ('SmoothingCorr', 'i2'),
 ('CodeVar', 'u2'),
 ('CarrierVar', 'u2'),
 ('LockTime', 'u2'),
 ('CumLossCont', 'u1'),
 ('Reserved', 'u1'),
 ('Info', 'u1')
)

IQCorr = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
 ('CorrDuration', 'u1'),
 ('CumClkJumps', 'i1'),
 ('Reserved', 'u1[2]')
)

IQCorr_CorrChannel = (
 ('RxChannel', 'u1'),
 ('Type', 'u1'),
 ('SVID', 'u1'),
 ('CorrIQ_MSB', 'u1'),
 ('CorrI_LSB', 'u1'),
 ('CorrQ_LSB', 'u1'),
 ('CarrierPhaseLSB', 'u2'),
)

EndOfMeas = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
)

GPSRawCA = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

GPSRawL2C = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

GPSRawL5 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

GLORawCA = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[3]'),
)

GALRawFNAV = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[8]'),
)

GALRawINAV = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[8]'),
)

GALRawCNAV = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[16]'),
)

GEORawL1 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[8]'),
)

CMPRaw = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

QZSRawL1CA = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

QZSRawL2C = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

QZSRawL5 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('CRCPassed', 'u1'),
 ('ViterbiCount', 'u1'),
 ('Source', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u1'),
 ('NAVBits', 'u4[10]'),
)

GPSNav = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('WN', 'i2'),
 ('CAorPonL2', 'u1'),
 ('URA', 'u1'),
 ('health', 'u1'),
 ('L2DataFlag', 'u1'),
 ('IODC', 'u2'),
 ('IODE2', 'u1'),
 ('IODE3', 'u1'),
 ('FitIntFlg', 'u1'),
 ('Reserved', 'u1'),
 ('T_gd', 'f4'),
 ('T_oc', 'u4'),
 ('A_f2', 'f4'),
 ('A_f1', 'f4'),
 ('A_f0', 'f4'),
 ('C_rs', 'f4'),
 ('DELTA_N', 'f4'),
 ('M_0', 'f8'),
 ('C_uc', 'f4'),
 ('E', 'f8'),
 ('C_us', 'f4'),
 ('SQRT_A', 'f8'),
 ('T_oe', 'u4'),
 ('C_ic', 'f4'),
 ('OMEGA_0', 'f8'),
 ('C_is', 'f4'),
 ('I_0', 'f8'),
 ('C_rc', 'f4'),
 ('omega', 'f8'),
 ('OMEGADOT', 'f4'),
 ('IDOT', 'f4'),
 ('WNt_oc', 'u2'),
 ('WNt_oe', 'u2'),
)

GPSAlm = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('E', 'f4'),
 ('t_oa', 'u4'),
 ('Delta_i', 'f4'),
 ('OMEGADOT', 'f4'),
 ('SQRT_A', 'f4'),
 ('OMEGA_0', 'f4'),
 ('Omega', 'f4'),
 ('M_0', 'f4'),
 ('a_f1', 'f4'),
 ('a_f0', 'f4'),
 ('WN_a', 'u1'),
 ('AS_config', 'u1'),
 ('health8', 'u1'),
 ('health6', 'u1'),
)

GPSIon = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('alpha_0', 'f4'),
 ('alpha_1', 'f4'),
 ('alpha_2', 'f4'),
 ('alpha_3', 'f4'),
 ('beta_0', 'f4'),
 ('beta_1', 'f4'),
 ('beta_2', 'f4'),
 ('beta_3', 'f4'),
)

GPSUtc = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('A_1', 'f4'),
 ('A_0', 'f8'),
 ('t_ot', 'u4'),
 ('WN_t', 'u1'),
 ('DEL_t_LS', 'i1'),
 ('WN_LSF', 'u1'),
 ('DN', 'u1'),
 ('DEL_t_LSF', 'i1'),
)

GLONav = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
 ('Dx', 'f4'),
 ('Dy', 'f4'),
 ('Dz', 'f4'),
 ('Ddx', 'f4'),
 ('Ddy', 'f4'),
 ('Ddz', 'f4'),
 ('gamma', 'f4'),
 ('tau', 'f4'),
 ('dtau', 'f4'),
 ('t_oe', 'u4'),
 ('WN_toe', 'u2'),
 ('P1', 'u1'),
 ('P2', 'u1'),
 ('E', 'u1'),
 ('B', 'u1'),
 ('tb', 'u2'),
 ('M', 'u1'),
 ('P', 'u1'),
 ('l', 'u1'),
 ('P4', 'u1'),
 ('N_T', 'u2'),
 ('F_T', 'u2'),
)

GLOAlm = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('epsilon', 'f4'),
 ('t_oa', 'u4'),
 ('Delta_i', 'f4'),
 ('Lambda', 'f4'),
 ('t_ln', 'f4'),
 ('omega', 'f4'),
 ('Delta_T', 'f4'),
 ('dDelta_t', 'f4'),
 ('tau', 'f4'),
 ('WN_a', 'u1'),
 ('C', 'u1'),
 ('N', 'u2'),
 ('M', 'u1'),
 ('N_4', 'u1'),
 ('Reserved', 'u1[2]'),
)

GLOTime = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('N_4', 'u1'),
 ('KP', 'u1'),
 ('N', 'u2'),
 ('tau_GPS', 'f4'),
 ('tau_c', 'f8'),
 ('B1', 'f4'),
 ('B2', 'f4'),
)

GalNav = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('Source', 'u1'),
 ('SQRT_A', 'f8'),
 ('M_0', 'f8'),
 ('E', 'f8'),
 ('i_0', 'f8'),
 ('Omega', 'f8'),
 ('OMEGA_0', 'f8'),
 ('OMEGADOT', 'f4'),
 ('IDOT', 'f4'),
 ('DELTA_N', 'f4'),
 ('C_uc', 'f4'),
 ('C_us', 'f4'),
 ('C_rc', 'f4'),
 ('C_rs', 'f4'),
 ('C_ic', 'f4'),
 ('C_is', 'f4'),
 ('t_oe', 'u4'),
 ('t_oc', 'u4'),
 ('a_f2', 'f4'),
 ('a_f1', 'f4'),
 ('a_f0', 'f8'),
 ('WNt_oc', 'u2'),
 ('WNt_oe', 'u2'),
 ('IODnav', 'u2'),
 ('Health_OSSOL', 'u2'),
 ('Reserved', 'u1'),
 ('SISA_L1E5a', 'u1'),
 ('SISA_L1E5b', 'u1'),
 ('Reserved', 'u1'),
 ('BGD_L1E5a', 'f4'),
 ('BGD_L1E5b', 'f4'),
 ('Reserved', 'f4'),
 ('CNAVEncrypt', 'u1'),
)

GalAlm = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('Source', 'u1'),
 ('e', 'f4'),
 ('t_oa', 'u4'),
 ('Delta_i', 'f4'),
 ('OMEGADOT', 'f4'),
 ('DeltaSQRT_A', 'f4'),
 ('OMEGA_0', 'f4'),
 ('Omega', 'f4'),
 ('M_0', 'f4'),
 ('a_f1', 'f4'),
 ('a_f0', 'f4'),
 ('WN_a', 'u1'),
 ('SVID_A', 'u1'),
 ('health', 'u2'),
 ('IODa', 'u1'),
 ('Reserved', 'u1[3]'),
)

GalIon = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('Source', 'u1'),
 ('a_i0', 'f4'),
 ('a_i1', 'f4'),
 ('a_i2', 'f4'),
 ('StormFlags', 'u1'),
)

GalUtc = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('Source', 'u1'),
 ('A_1', 'f4'),
 ('A_0', 'f8'),
 ('t_ot', 'u4'),
 ('WN_ot', 'u1'),
 ('DEL_t_LS', 'i1'),
 ('WN_LSF', 'u1'),
 ('DN', 'u1'),
 ('DEL_t_LSF', 'i1'),
)

GalGstGps = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('Source', 'u1'),
 ('A_1G', 'f4'),
 ('A_0G', 'f4'),
 ('t_oG', 'u1'),
 ('WN_oG', 'u1'),
)

GalSARRLM = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SVID', 'u1'),
 ('Source', 'u1'),
 ('RLMLength', 'u1'),
 ('Reserved', 'u1[3]'),
 ('RLMBits', 'u4*'),
)

GEOMT00 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
)

GEOPRNMask = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('IODP', 'u1'),
 ('NbrPRNs', 'u1'),
 ('PRNMask', 'u1*'),
)

GEOFastCorr = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('MT', 'u1'),
 ('IODP', 'u1'),
 ('IODF', 'u1'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

GEOFastCorr_FastCorr = (
 ('PRNMaskNo', 'u1'),
 ('UDREI', 'u1'),
 ('Reserved', 'u1[2]'),
 ('PRC', 'f4'),
)

GEOIntegrity = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('IODF', 'u1[4]'),
 ('UDREI', 'u1[51]'),
)

GEOFastCorrDegr = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('IODP', 'u1'),
 ('t_lat', 'u1'),
 ('AI', 'u1[51]'),
)

GEODegrFactors = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('Brrc', 'f8'),
 ('Cltc_lsb', 'f8'),
 ('Cltc_v1', 'f8'),
 ('Iltc_v1', 'u4'),
 ('Cltc_v0', 'f8'),
 ('Iltc_v0', 'u4'),
 ('Cgeo_lsb', 'f8'),
 ('Cgeo_v', 'f8'),
 ('Igeo', 'u4'),
 ('Cer', 'f4'),
 ('Ciono_step', 'f8'),
 ('Iiono', 'u4'),
 ('Ciono_ramp', 'f8'),
 ('RSSudre', 'u1'),
 ('RSSiono', 'u1'),
 ('Reserved', 'u1[2]'),
 ('Ccovariance', 'f8'),
)


GEONetworkTime = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('A1', 'f4'),
 ('A0', 'f8'),
 ('t_ot', 'u4'),
 ('WNt', 'u1'),
 ('DEL_t_1S', 'i1'),
 ('WN_LSF', 'u1'),
 ('DN', 'u1'),
 ('DEL_t_LSF', 'i1'),
 ('UTCStdId', 'u1'),
 ('GPSWN', 'u2'),
 ('GPSTOW', 'u4'),
 ('GLONASSind', 'u1'),
)


GEONav = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('IODN_Spare', 'u2'),
 ('URA', 'u2'),
 ('t0', 'u4'),
 ('Xg', 'f8'),
 ('Yg', 'f8'),
 ('Zg', 'f8'),
 ('Xgd', 'f8'),
 ('Ygd', 'f8'),
 ('Zgd', 'f8'),
 ('Xgdd', 'f8'),
 ('Ygdd', 'f8'),
 ('Zgdd', 'f8'),
 ('AGf0', 'f4'),
 ('AGf1', 'f4'),
)


GEOAlm = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('DataID', 'u1'),
 ('Reserved', 'u1'),
 ('Health', 'u2'),
 ('t0', 'u4'),
 ('Xg', 'f8'),
 ('Yg', 'f8'),
 ('Zg', 'f8'),
 ('Xgd', 'f8'),
 ('Ygd', 'f8'),
 ('Zgd', 'f8'),
)


GEOIGPMask = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('NbrBands', 'u1'),
 ('BandNbr', 'u1'),
 ('IODI', 'u1'),
 ('NbrIGPs', 'u1'),
 ('IGPMask', 'u1*'),
)


GEOLongTermCorr = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
 ('Reserved', 'u1[3]'),
)

GEOLongTermCorr_LTCorr = (
 ('VelocityCode', 'u1'),
 ('PRNMaskNo', 'u1'),
 ('IODP', 'u1'),
 ('IODE', 'u1'),
 ('dx', 'f4'),
 ('dy', 'f4'),
 ('dz', 'f4'),
 ('dxRate', 'f4'),
 ('dyRate', 'f4'),
 ('dzRate', 'f4'),
 ('da_f0', 'f4'),
 ('da_f1', 'f4'),
 ('t_oe', 'u4'),
)


GEOIonoDelay = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('BandNbr', 'u1'),
 ('IODI', 'u1'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
 ('Reserved', 'u1'),
)

GEOIonoDelay_IDC = (
 ('IGPMaskNo', 'u1'),
 ('GIVEI', 'u1'),
 ('Reserved', 'u1[2]'),
 ('VerticalDelay', 'f4'),
)


GEOServiceLevel = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('Reserved', 'u1'),
 ('IODS', 'u1'),
 ('NrMessages', 'u1'),
 ('MessageNr', 'u1'),
 ('PriorityCode', 'u1'),
 ('dUDREI_In', 'u1'),
 ('dUDREI_Out', 'u1'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

GEOServiceLevel_ServiceRegion = (
 ('Latitude1', 'i1'),
 ('Latitude2', 'i1'),
 ('Longitude1', 'i2'),
 ('Longitude2', 'i2'),
 ('RegionShape', 'u1'),
 ('Reserved', 'u1'),
)


GEOClockEphCovMatrix = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('PRN', 'u1'),
 ('IODP', 'u1'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
 ('Reserved', 'u1[2]'),
)

GEOClockEphCovMatrix_CovMatrix = (
 ('PRNMaskNo', 'u1'),
 ('Reserved', 'u1[2]'),
 ('ScaleExp', 'u1'),
 ('E11', 'u2'),
 ('E22', 'u2'),
 ('E33', 'u2'),
 ('E44', 'u2'),
 ('E12', 'i2'),
 ('E13', 'i2'),
 ('E14', 'i2'),
 ('E23', 'i2'),
 ('E24', 'i2'),
 ('E34', 'i2'),
)

PVTCartesian_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
 ('Undulation', 'f4'),
 ('Vx', 'f4'),
 ('Vy', 'f4'),
 ('Vz', 'f4'),
 ('COG', 'f4'),
 ('RxClkBias', 'f8'),
 ('RxClkDrift', 'f4'),
 ('TimeSystem', 'u1'),
 ('Datum', 'u1'),
 ('NrSV', 'u1'),
 ('WACorrInfo', 'u1'),
 ('ReferenceID', 'u2'),
 ('MeanCorrAge', 'u2'),
 ('SignalInfo', 'u4'),
 ('AlertFlag', 'u1'),
 ('NrBases', 'u1'),
 ('Reserved', 'u1[2]'),
)

PVTGeodetic_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Phi', 'f8'),
 ('Lambda', 'f8'),
 ('h', 'f8'),
 ('Undulation', 'f4'),
 ('Vn', 'f4'),
 ('Ve', 'f4'),
 ('Vu', 'f4'),
 ('COG', 'f4'),
 ('RxClkBias', 'f8'),
 ('RxClkDrift', 'f4'),
 ('TimeSystem', 'u1'),
 ('Datum', 'u1'),
 ('NrSV', 'u1'),
 ('WACorrInfo', 'u1'),
 ('ReferenceID', 'u2'),
 ('MeanCorrAge', 'u2'),
 ('SignalInfo', 'u4'),
 ('AlertFlag', 'u1'),
 ('NrBases', 'u1'),
 ('Reserved', 'u1[2]'),
)

PosCovCartesian = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_xx', 'f4'),
 ('Cov_yy', 'f4'),
 ('Cov_zz', 'f4'),
 ('Cov_bb', 'f4'),
 ('Cov_xy', 'f4'),
 ('Cov_xz', 'f4'),
 ('Cov_xb', 'f4'),
 ('Cov_yz', 'f4'),
 ('Cov_yb', 'f4'),
 ('Cov_zb', 'f4'),
)

PosCovGeodetic = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_PhiPhi', 'f4'),
 ('Cov_LambdaLambda', 'f4'),
 ('Cov_hh', 'f4'),
 ('Cov_bb', 'f4'),
 ('Cov_PhiLambda', 'f4'),
 ('Cov_Phih', 'f4'),
 ('Cov_Phib', 'f4'),
 ('Cov_Lambdah', 'f4'),
 ('Cov_Lambdab', 'f4'),
 ('Cov_hb', 'f4'),
)

VelCovCartesian = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_VxVx', 'f4'),
 ('Cov_VyVy', 'f4'),
 ('Cov_VzVz', 'f4'),
 ('Cov_DtDt', 'f4'),
 ('Cov_VxVy', 'f4'),
 ('Cov_VxVz', 'f4'),
 ('Cov_VxDt', 'f4'),
 ('Cov_VyVz', 'f4'),
 ('Cov_VyDt', 'f4'),
 ('Cov_VzDt', 'f4'),
)

VelCovGeodetic = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_VnVn', 'f4'),
 ('Cov_VeVe', 'f4'),
 ('Cov_VuVu', 'f4'),
 ('Cov_DtDt', 'f4'),
 ('Cov_VnVe', 'f4'),
 ('Cov_VnVu', 'f4'),
 ('Cov_VnDt', 'f4'),
 ('Cov_VeVu', 'f4'),
 ('Cov_VeDt', 'f4'),
 ('Cov_VuDt', 'f4'),
)

DOP_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('NrSV', 'u1'),
 ('Reserved', 'u1'),
 ('PDOP', 'u2'),
 ('TDOP', 'u2'),
 ('HDOP', 'u2'),
 ('VDOP', 'u2'),
 ('HPL', 'f4'),
 ('VPL', 'f4'),
)


PosCart = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
 ('Base2RoverX', 'f8'),
 ('Base2RoverY', 'f8'),
 ('Base2RoverZ', 'f8'),
 ('Cov_xx', 'f4'),
 ('Cov_yy', 'f4'),
 ('Cov_zz', 'f4'),
 ('Cov_xy', 'f4'),
 ('Cov_xz', 'f4'),
 ('Cov_yz', 'f4'),
 ('PDOP', 'u2'),
 ('HDOP', 'u2'),
 ('VDOP', 'u2'),
 ('Misc', 'u1'),
 ('Reserved', 'u1'),
 ('AlertFlag', 'u1'),
 ('Datum', 'u1'),
 ('NrSV', 'u1'),
 ('WACorrInfo', 'u1'),
 ('ReferenceID', 'u2'),
 ('MeanCorrAge', 'u2'),
 ('SignalInfo', 'u4'),
)

PVTSatCartesian = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

PVTSatCartesian_SatPos = (
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('IODE', 'u2'),
 ('x', 'f8'),
 ('y', 'f8'),
 ('z', 'f8'),
 ('Vx', 'f4'),
 ('Vy', 'f4'),
 ('Vz', 'f4'),
)

PVTResiduals_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SB1Length', 'u1'),
 ('SB2Length', 'u1'),
)

PVTResiduals_v2_SatSignalInfo = (
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('Type', 'u1'),
 ('RefSVID', 'u1'),
 ('RefFreqNr', 'u1'),
 ('MeasInfo', 'u1'),
 ('IODE', 'u2'),
 ('CorrAge', 'u2'),
 ('ReferenceID', 'u2'),
)

PVTResiduals_v2_ResidualInfo = (
 ('e_i', 'f4'),
 ('w_i', 'u2'),
 ('MDB', 'u2'),
)

RAIMStatistics_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('IntegrityFlag', 'u1'),
 ('Reserved', 'u1'),
 ('HERL_position', 'f4'),
 ('VERL_position', 'f4'),
 ('HERL_velocity', 'f4'),
 ('VERL_velocity', 'f4'),
 ('OverallModel', 'u2'),
 ('Reserved', 'u1[2]'),
)

GEOCorrections = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

GEOCorrections_SatCorr = (
 ('SVID', 'u1'),
 ('IODE', 'u1'),
 ('Reserved', 'u1[2]'),
 ('PRC', 'f4'),
 ('CorrAgeFC', 'f4'),
 ('DeltaX', 'f4'),
 ('DeltaY', 'f4'),
 ('DeltaZ', 'f4'),
 ('DeltaClock', 'f4'),
 ('CorrAgeLT', 'f4'),
 ('IonoPPlat', 'f4'),
 ('IonoPPLon', 'f4'),
 ('SlantIono', 'f4'),
 ('CorrAgeIono', 'f4'),
 ('VarFLT', 'f4'),
 ('VarUIRE', 'f4'),
 ('VarAir', 'f4'),
 ('VarTropo', 'f4'),
)

BaseVectorCart = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

BaseVectorCart_VectorInfoCart = (
 ('NrSV', 'u1'),
 ('Error', 'u1'),
 ('Mode', 'u1'),
 ('Misc', 'u1'),
 ('dX', 'f8'),
 ('dY', 'f8'),
 ('dZ', 'f8'),
 ('dVx', 'f4'),
 ('dVy', 'f4'),
 ('dVz', 'f4'),
 ('Azimuth', 'u2'),
 ('Elevation', 'i2'),
 ('ReferenceID', 'u2'),
 ('CorrAge', 'u2'),
 ('SignalInfo', 'u4'),
)

BaseVectorGeod = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

BaseVectorGeod_VectorInfoGeod = (
 ('NrSV', 'u1'),
 ('Error', 'u1'),
 ('Mode', 'u1'),
 ('Misc', 'u1'),
 ('dEast', 'f8'),
 ('dNorth', 'f8'),
 ('dUp', 'f8'),
 ('dVe', 'f4'),
 ('dVn', 'f4'),
 ('dVu', 'f4'),
 ('Azimuth', 'u2'),
 ('Elevation', 'i2'),
 ('ReferenceID', 'u2'),
 ('CorrAge', 'u2'),
 ('SignalInfo', 'u4'),
)

PVTSupport = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
)

EndOfPVT = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
)

IntPVCart = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Info', 'u2'),
 ('NrSV', 'u1'),
 ('NrAnt', 'u1'),
 ('GNSSPVTMode', 'u1'),
 ('Datum', 'u1'),
 ('GNSSage', 'u2'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
 ('Vx', 'f4'),
 ('Vy', 'f4'),
 ('Vz', 'f4'),
 ('COG', 'f4'),
)

IntPVGeod = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Info', 'u2'),
 ('NrSV', 'u1'),
 ('NrAnt', 'u1'),
 ('GNSSPVTMode', 'u1'),
 ('Datum', 'u1'),
 ('GNSSage', 'u2'),
 ('Lat', 'f8'),
 ('Long', 'f8'),
 ('Alt', 'f8'),
 ('Vn', 'f4'),
 ('Ve', 'f4'),
 ('Vu', 'f4'),
 ('COG', 'f4'),
)

IntPosCovCart = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_xx', 'f4'),
 ('Cov_yy', 'f4'),
 ('Cov_zz', 'f4'),
 ('Cov_xy', 'f4'),
 ('Cov_xz', 'f4'),
 ('Cov_yz', 'f4'),
)

IntVelCovCart = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_VxVx', 'f4'),
 ('Cov_VyVy', 'f4'),
 ('Cov_VzVz', 'f4'),
 ('Cov_VxVy', 'f4'),
 ('Cov_VxVz', 'f4'),
 ('Cov_VyVz', 'f4'),
)

IntPosCovGeod = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_LatLat', 'f4'),
 ('Cov_LonLon', 'f4'),
 ('Cov_AltAlt', 'f4'),
 ('Cov_LatLon', 'f4'),
 ('Cov_LatAlt', 'f4'),
 ('Cov_LonAlt', 'f4'),
)

IntVelCovGeod = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_VnVn', 'f4'),
 ('Cov_VeVe', 'f4'),
 ('Cov_VuVu', 'f4'),
 ('Cov_VnVe', 'f4'),
 ('Cov_VnVu', 'f4'),
 ('Cov_VeVu', 'f4'),
)

IntAttEuler = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Info', 'u2'),
 ('NrSV', 'u1'),
 ('NrAnt', 'u1'),
 ('Reserved', 'u1'),
 ('Datum', 'u1'),
 ('GNSSage', 'u2'),
 ('Heading', 'f4'),
 ('Pitch', 'f4'),
 ('Roll', 'f4'),
 ('PitchDot', 'f4'),
 ('RollDot', 'f4'),
 ('HeadingDot', 'f4'),
)

IntAttCovEuler = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Cov_HeadHead', 'f4'),
 ('Cov_PitchPitch', 'f4'),
 ('Cov_RollRoll', 'f4'),
 ('Cov_HeadPitch', 'f4'),
 ('Cov_HeadRoll', 'f4'),
 ('Cov_PitchRoll', 'f4'),
)

IntPVAAGeod = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Info', 'u2'),
 ('GNSSPVTMode', 'u1'),
 ('Datum', 'u1'),
 ('GNSSage', 'u1'),
 ('NrSVAnt', 'u1'),
 ('Reserved', 'u1'),
 ('PosFine', 'u1'),
 ('Lat', 'i4'),
 ('Long', 'i4'),
 ('Alt', 'i4'),
 ('Vn', 'i4'),
 ('Ve', 'i4'),
 ('Vu', 'i4'),
 ('Ax', 'i2'),
 ('Ay', 'i2'),
 ('Az', 'i2'),
 ('Heading', 'u2'),
 ('Pitch', 'i2'),
 ('Roll', 'i2'),
)

AuxAntPositions = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

AuxAntPositions_AuxAntPosition = (
 ('NrSV', 'u1'),
 ('Error', 'u1'),
 ('AmbiguityType', 'u1'),
 ('AuxAntID', 'u1'),
 ('dEast', 'f8'),
 ('dNorth', 'f8'),
 ('dUp', 'f8'),
 ('EastVel', 'f8'),
 ('NorthVel', 'f8'),
 ('UpVel', 'f8'),
)

AttEuler = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('NrSV', 'u1'),
 ('Error', 'u1'),
 ('Mode', 'u2'),
 ('Datum', 'u1'),
 ('Reserved', 'u1'),
 ('Heading', 'f4'),
 ('Pitch', 'f4'),
 ('Roll', 'f4'),
 ('PitchDot', 'f4'),
 ('RollDot', 'f4'),
 ('HeadingDot', 'f4'),
)

AttCovEuler = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Reserved', 'u1'),
 ('Error', 'u1'),
 ('Cov_HeadHead', 'f4'),
 ('Cov_PitchPitch', 'f4'),
 ('Cov_RollRoll', 'f4'),
 ('Cov_HeadPitch', 'f4'),
 ('Cov_HeadRoll', 'f4'),
 ('Cov_PitchRoll', 'f4'),
)

EndOfAtt = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
)

ReceiverTime = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('UTCYear', 'i1'),
 ('UTCMonth', 'i1'),
 ('UTCDay', 'i1'),
 ('UTCHour', 'i1'),
 ('UTCMin', 'i1'),
 ('UTCSec', 'i1'),
 ('DeltaLS', 'i1'),
 ('SyncLevel', 'u1'),
 ('Reserved', 'u2'),
)

xPPSOffset = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('SyncAge', 'u1'),
 ('Timescale', 'u1'),
 ('Offset', 'f4'),
)

ExtEvent = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Source', 'u1'),
 ('Polarity', 'u1'),
 ('Offset', 'f4'),
 ('RxClkBias', 'f8'),
 ('PVTAge', 'u2'),
 ('Reserved', 'u1[2]'),
)

ExtEventPVTCartesian = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
 ('Undulation', 'f4'),
 ('Vx', 'f4'),
 ('Vy', 'f4'),
 ('Vz', 'f4'),
 ('COG', 'f4'),
 ('RxClkBias', 'f8'),
 ('RxClkDrift', 'f4'),
 ('TimeSystem', 'u1'),
 ('Datum', 'u1'),
 ('NrSV', 'u1'),
 ('WACorrInfo', 'u1'),
 ('ReferenceID', 'u2'),
 ('MeanCorrAge', 'u2'),
 ('SignalInfo', 'u4'),
 ('AlertFlag', 'u1'),
 ('NrBases', 'u1'),
 ('Reserved', 'u1[2]'),
)

ExtEventPVTGeodetic = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Error', 'u1'),
 ('Phi', 'f8'),
 ('Lambda', 'f8'),
 ('h', 'f8'),
 ('Undulation', 'f4'),
 ('Vn', 'f4'),
 ('Ve', 'f4'),
 ('Vu', 'f4'),
 ('COG', 'f4'),
 ('RxClkBias', 'f8'),
 ('RxClkDrift', 'f4'),
 ('TimeSystem', 'u1'),
 ('Datum', 'u1'),
 ('NrSV', 'u1'),
 ('WACorrInfo', 'u1'),
 ('ReferenceID', 'u2'),
 ('MeanCorrAge', 'u2'),
 ('SignalInfo', 'u4'),
 ('AlertFlag', 'u1'),
 ('NrBases', 'u1'),
 ('Reserved', 'u1[2]'),
)

#Need more info on this block.
DiffCorrIn = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Mode', 'u1'),
 ('Source', 'u1'),
 ('MessageContent', 'c1*'),
)

BaseStation = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('BaseStationID', 'u2'),
 ('BaseType', 'u1'),
 ('Source', 'u1'),
 ('Datum', 'u1'),
 ('Reserved', 'u1'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
)

LBandTrackerStatus = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

LBandTrackerStatus_TrackData = (
 ('Frequency', 'u4'),
 ('Baudrate', 'u2'),
 ('ServiceID', 'u2'),
 ('FreqOffset', 'f4'),
 ('CN0', 'u2'),
 ('AvgPower', 'i2'),
 ('AGCGain', 'i1'),
 ('Mode', 'u1'),
 ('Status', 'u1'),
 ('Reserved', 'u1'),
 ('LockTime', 'u2'),
 ('Reserved', 'u2'),
)

LBAS1DecoderStatus = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Reserved', 'u2'),
 ('Status', 'u1'),
 ('Access', 'u1'),
 ('GeoGatingMode', 'u1'),
 ('GeoGatingStatus', 'u1'),
 ('Event', 'u4'),
)

LBAS1Messages = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('MessageLength', 'u2'),
 ('Message', 'c1*'),
)

ExtSensorMeas = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

ExtSensorMeas_MeasSet = (
 ('Source', 'u1'),
 ('SensorModel', 'u1'),
 ('Type', 'u1'),
 ('ObsInfo', 'u1'),
 ('X', 'f8'),
 ('Y', 'f8'),
 ('Z', 'f8'),
)

ExtSensorStatus = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Source', 'u1'),
 ('SensorModel', 'u1'),
 ('StatusType', 'u1'),
 ('Reserved', 'u1[3]'),
 ('StatusBits', 'u1*'),
)

ExtSensorSetup = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

ExtSensorSetup_OneSensor = (
 ('Source', 'u1'),
 ('SensorModel', 'u1'),
 ('MeasType', 'u2'),
)

ChannelStatus = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N1', 'u1'),
 ('SB1Length', 'u1'),
 ('SB2Length', 'u1'),
 ('Reserved', 'u1[3]'),
)

ChannelStatus_ChannelSatInfo = (
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('Reserved', 'u2'),
 ('Azimuth_RiseSet', 'u2'),
 ('HealthStaus', 'u2'),
 ('Elevation', 'i1'),
 ('N2', 'u1'),
 ('RxChannel', 'u1'),
 ('Reserved', 'u1'),
)

ChannelStatus_ChannelStateInfo = (
 ('Antenna', 'u1'),
 ('Reserved', 'u1'),
 ('TrackingStatus', 'u2'),
 ('PVTStatus', 'u2'),
 ('PVTInfo', 'u2'),
)

ReceiverStatus_v2 = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('CPULoad', 'u1'),
 ('ExtError', 'u1'),
 ('UpTime', 'u4'),
 ('RxState', 'u4'),
 ('RxError', 'u4'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
 ('Reserved', 'u1[2]'),
)

ReceiverStatus_v2_AGCData = (
 ('FrontendID', 'u1'),
 ('Gain', 'i1'),
 ('SampleVar', 'u1'),
 ('BlankingStat', 'u1'),
)

SatVisibility = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

SatVisibility_SatInfo = (
 ('SVID', 'u1'),
 ('FreqNr', 'u1'),
 ('Azimuth', 'u2'),
 ('Elevation', 'i2'),
 ('RiseSet', 'u1'),
 ('SatelliteInfo', 'u1'),
)

InputLink = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u1'),
 ('SBLength', 'u1'),
)

InputLink_InputStats = (
 ('CD', 'u1'),
 ('Type', 'u1'),
 ('AgeOfLastMessage', 'u2'),
 ('NrBytesReceived', 'u4'),
 ('NrBytesAccepted', 'u4'),
 ('NrMsgReceived', 'u4'),
 ('NrMsgAccepted', 'u4'),
)

OutputLink = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N1', 'u1'),
 ('SB1Length', 'u1'),
 ('SB2Length', 'u1'),
 ('Reserved', 'u1[3]'),
)

OutputLink_OutputStats = (
 ('CD', 'u1'),
 ('N2', 'u1'),
 ('AllowedRate', 'u2'),
 ('NrBytesProduced', 'u4'),
 ('NrBytesSent', 'u4'),
 ('NrClients', 'u1'),
)

OutputLink_OutputType = (
 ('Type', 'u1'),
 ('Percentage', 'u1'),
 ('Reserved', 'u1[2]'),
)

IPStatus = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('MACAddress', 'u1[6]'),
 ('IPAddress', 'u1[16]'),
 ('Gateway', 'u1[16]'),
 ('Netmask', 'u1'),
)

ReceiverSetup = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Reserved', 'u1[2]'),
 ('MarkerName', 'c1[60]'),
 ('MarkerNumber', 'c1[20]'),
 ('Observer', 'c1[20]'),
 ('Agency', 'c1[40]'),
 ('RxSerialNumber', 'c1[20]'),
 ('RxName', 'c1[20]'),
 ('RxVersion', 'c1[20]'),
 ('AntSerialNbr', 'c1[20]'),
 ('AntType', 'c1[20]'),
 ('DeltaH', 'f4'),
 ('DeltaE', 'f4'),
 ('DeltaN', 'f4'),
 ('MarkerType', 'c1[20]'),
 ('GNSSFWVersion', 'c1[40]'),
 ('ProductName', 'c1[40]'),
)

#Need more info for this block.
Commands = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('Reserved', 'u1[2]'),
 ('CmdData', 'c1*'),
)


Comment = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('CommentLn', 'u2'),
 ('Comment', 'c1*'),
)


BBSamples = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('N', 'u2'),
 ('Info', 'u1'),
 ('Reserved', 'u1[3]'),
 ('SampleFreq', 'u4'),
 ('LOFreq', 'u4'),
 ('Samples', 'u2*'),
)


ASCIIIn = (
 ('TOW', 'u4'),
 ('WNc', 'u2'),
 ('CD', 'u1'),
 ('Reserved', 'u1'),
 ('Reserved', 'u2'),
 ('StringLn', 'u2'),
 ('Reserved', 'u1[60]'),
 ('ASCIIString', 'c1*'),
)
