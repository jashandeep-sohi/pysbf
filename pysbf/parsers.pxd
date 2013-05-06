
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
cdef dict BLOCKPARSERS_BYTES


cdef packed struct MeasEpoch_v2:
 u4 TOW
 u2 WNc
 u1 N1
 u1 SB1Length
 u1 SB2Length
 u1 CommonFlags
 i1 CumClkJumps
 u1 Reserved_0


cdef packed struct MeasEpoch_v2_Type_1:
 u1 RxChannel
 u1 Type
 u1 SVID
 u1 Misc
 u4 CodeLSB
 i4 Doppler
 u2 CarrierLSB
 i1 CarrierMSB
 u1 CN0
 u2 LockTime
 u1 ObsInfo
 u1 N2


cdef packed struct MeasEpoch_v2_Type_2:
 u1 Type
 u1 LockTime
 u1 CN0
 u1 OffsetMSB
 i1 CarrierMSB
 u1 ObsInfo
 u2 CodeOffsetLSB
 u2 CarrierLSB
 u2 DopplerOffsetLSB


cdef packed struct MeasExtra:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength
 f4 DopplerVarFactor


cdef packed struct MeasExtra_MeasExtraChannel:
 u1 RxChannel
 u1 Type
 i2 MPCorrection 
 i2 SmoothingCorr
 u2 CodeVar
 u2 CarrierVar
 u2 LockTime
 u1 CumLossCont
 u1 Reserved_0
 u1 Info


cdef packed struct IQCorr:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength
 u1 CorrDuration
 i1 CumClkJumps
 u1[2] Reserved_0


cdef packed struct IQCorr_CorrChannel:
 u1 RxChannel
 u1 Type
 u1 SVID
 u1 CorrIQ_MSB
 u1 CorrI_LSB
 u1 CorrQ_LSB
 u2 CarrierPhaseLSB


cdef packed struct EndOfMeas:
 u4 TOW
 u2 WNc


cdef packed struct GPSRawCA:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct GPSRawL2C:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct GPSRawL5:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct GLORawCA:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[3] NAVBits


cdef packed struct GALRawFNAV:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[8] NAVBits


cdef packed struct GALRawINAV:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[8] NAVBits


cdef packed struct GALRawCNAV:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[16] NAVBits


cdef packed struct GEORawL1:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[8] NAVBits


cdef packed struct CMPRaw:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct QZSRawL1CA:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct QZSRawL2C:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct QZSRawL5:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 CRCPassed
 u1 ViterbiCount
 u1 Source
 u1 FreqNr
 u1 Reserved_0
 u4[10] NAVBits


cdef packed struct GPSNav:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 i2 WN
 u1 CAorPonL2
 u1 URA
 u1 health
 u1 L2DataFlag
 u2 IODC
 u1 IODE2
 u1 IODE3
 u1 FitIntFlg
 u1 Reserved_1
 f4 T_gd
 u4 T_oc
 f4 A_f2
 f4 A_f1
 f4 A_f0
 f4 C_rs
 f4 DELTA_N
 f8 M_0
 f4 C_uc
 f8 E
 f4 C_us
 f8 SQRT_A
 u4 T_oe
 f4 C_ic
 f8 OMEGA_0
 f4 C_is
 f8 I_0
 f4 C_rc
 f8 omega
 f4 OMEGADOT
 f4 IDOT
 u2 WNt_oc
 u2 WNt_oe


cdef packed struct GPSAlm:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 f4 E
 u4 t_oa
 f4 Delta_i
 f4 OMEGADOT
 f4 SQRT_A
 f4 OMEGA_0
 f4 Omega
 f4 M_0
 f4 a_f1
 f4 a_f0
 u1 WN_a
 u1 AS_config
 u1 health8
 u1 health6


cdef packed struct GPSIon:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 f4 alpha_0
 f4 alpha_1
 f4 alpha_2
 f4 alpha_3
 f4 beta_0
 f4 beta_1
 f4 beta_2
 f4 beta_3


cdef packed struct GPSUtc:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 f4 A_1
 f8 A_0
 u4 t_ot
 u1 WN_t
 i1 DEL_t_LS
 u1 WN_LSF
 u1 DN
 i1 DEL_t_LSF


cdef packed struct GLONav:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 FreqNr
 f8 X
 f8 Y
 f8 Z
 f4 Dx
 f4 Dy
 f4 Dz
 f4 Ddx
 f4 Ddy
 f4 Ddz
 f4 gamma
 f4 tau
 f4 dtau
 u4 t_oe
 u2 WN_toe
 u1 P1
 u1 P2
 u1 E
 u1 B
 u2 tb
 u1 M
 u1 P
 u1 l
 u1 P4
 u2 N_T
 u2 F_T


cdef packed struct GLOTime:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 FreqNr
 u1 N_4
 u1 KP
 u2 N
 f4 tau_GPS
 f8 tau_c
 f4 B1
 f4 B2


cdef packed struct GalNav:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 Source
 f8 SQRT_A
 f8 M_0
 f8 E
 f8 i_0
 f8 Omega
 f8 OMEGA_0
 f4 OMEGADOT
 f4 IDOT
 f4 DELTA_N
 f4 C_uc
 f4 C_us
 f4 C_rc
 f4 C_rs
 f4 C_ic
 f4 C_is
 u4 t_oe
 u4 t_oc
 f4 a_f2
 f4 a_f1
 f8 a_f0
 u2 WNt_oc
 u2 WNt_oe
 u2 IODnav
 u2 Health_OSSOL
 u1 Reserved_0
 u1 SISA_L1E5a
 u1 SISA_L1E5b
 u1 Reserved_1
 f4 BGD_L1E5a
 f4 BGD_L1E5b
 f4 Reserved_2
 u1 CNAVEncrypt


cdef packed struct GalAlm:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 Source
 f4 e
 u4 t_oa
 f4 Delta_i
 f4 OMEGADOT
 f4 DeltaSQRT_A
 f4 OMEGA_0
 f4 Omega
 f4 M_0
 f4 a_f1
 f4 a_f0
 u1 WN_a
 u1 SVID_A
 u2 health
 u1 IODa
 u1[3] Reserved_0


cdef packed struct GalIon:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 Source
 f4 a_i0
 f4 a_i1
 f4 a_i2
 u1 StormFlags


cdef packed struct GalUtc:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 Source
 f4 A_1
 f8 A_0
 u4 t_ot
 u1 WN_ot
 i1 DEL_t_LS
 u1 WN_LSF
 u1 DN
 i1 DEL_t_LSF


cdef packed struct GalGstGps:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 Source
 f4 A_1G
 f4 A_0G
 u1 t_oG
 u1 WN_oG


cdef packed struct GalSARRLM:
 u4 TOW
 u2 WNc
 u1 SVID
 u1 Source
 u1 RLMLength
 u1[3] Reserved_0
 u4* RLMBits


cdef packed struct GEOMT00:
 u4 TOW
 u2 WNc
 u1 PRN


cdef packed struct GEOPRNMask:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 IODP
 u1 NbrPRNs
 u1* PRNMask


cdef packed struct GEOFastCorr:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 MT
 u1 IODP
 u1 IODF
 u1 N
 u1 SBLength


cdef packed struct GEOFastCorr_FastCorr:
 u1 PRNMaskNo
 u1 UDREI
 u1[2] Reserved_0
 f4 PRC


cdef packed struct GEOIntegrity:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 u1[4] IODF
 u1[51] UDREI


cdef packed struct GEOFastCorrDegr:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 IODP
 u1 t_lat
 u1[51] AI


cdef packed struct GEODegrFactors:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 f8 Brrc
 f8 Cltc_lsb
 f8 Cltc_v1
 u4 Iltc_v1
 f8 Cltc_v0
 u4 Iltc_v0
 f8 Cgeo_lsb
 f8 Cgeo_v
 u4 Igeo
 f4 Cer
 f8 Ciono_step
 u4 Iiono
 f8 Ciono_ramp
 u1 RSSudre
 u1 RSSiono
 u1[2] Reserved_1
 f8 Ccovariance


cdef packed struct GEONetworkTime:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 f4 A1
 f8 A0
 u4 t_ot
 u1 WNt
 i1 DEL_t_1S
 u1 WN_LSF
 u1 DN
 i1 DEL_t_LSF
 u1 UTCStdId
 u2 GPSWN
 u4 GPSTOW
 u1 GLONASSind


cdef packed struct GEONav:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 u2 IODN_Spare
 u2 URA
 u4 t0
 f8 Xg
 f8 Yg
 f8 Zg
 f8 Xgd
 f8 Ygd
 f8 Zgd
 f8 Xgdd
 f8 Ygdd
 f8 Zgdd
 f4 AGf0
 f4 AGf1


cdef packed struct GEOAlm:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 u1 DataID
 u1 Reserved_1
 u2 Health
 u4 t0
 f8 Xg
 f8 Yg
 f8 Zg
 f8 Xgd
 f8 Ygd
 f8 Zgd


cdef packed struct GEOIGPMask:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 NbrBands
 u1 BandNbr
 u1 IODI
 u1 NbrIGPs
 u1* IGPMask


cdef packed struct GEOLongTermCorr:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 N
 u1 SBLength
 u1[3] Reserved_0


cdef packed struct GEOLongTermCorr_LTCorr:
 u1 VelocityCode
 u1 PRNMaskNo
 u1 IODP
 u1 IODE
 f4 dx
 f4 dy
 f4 dz
 f4 dxRate
 f4 dyRate
 f4 dzRate
 f4 da_f0
 f4 da_f1
 u4 t_oe


cdef packed struct GEOIonoDelay:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 BandNbr
 u1 IODI
 u1 N
 u1 SBLength
 u1 Reserved_0


cdef packed struct GEOIonoDelay_IDC:
 u1 IGPMaskNo
 u1 GIVEI
 u1[2] Reserved_0
 f4 VerticalDelay


cdef packed struct GEOServiceLevel:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 Reserved_0
 u1 IODS
 u1 NrMessages
 u1 MessageNr
 u1 PriorityCode
 u1 dUDREI_In
 u1 dUDREI_Out
 u1 N
 u1 SBLength


cdef packed struct GEOServiceLevel_ServiceRegion:
 i1 Latitude1
 i1 Latitude2
 i2 Longitude1
 i2 Longitude2
 u1 RegionShape
 u1 Reserved_0


cdef packed struct GEOClockEphCovMatrix:
 u4 TOW
 u2 WNc
 u1 PRN
 u1 IODP
 u1 N
 u1 SBLength
 u1[2] Reserved_0


cdef packed struct GEOClockEphCovMatrix_CovMatrix:
 u1 PRNMaskNo
 u1[2] Reserved_0
 u1 ScaleExp
 u2 E11
 u2 E22
 u2 E33
 u2 E44
 i2 E12
 i2 E13
 i2 E14
 i2 E23
 i2 E24
 i2 E34


cdef packed struct PVTCartesian_v2:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f8 X
 f8 Y
 f8 Z
 f4 Undulation
 f4 Vx
 f4 Vy
 f4 Vz
 f4 COG
 f8 RxClkBias
 f4 RxClkDrift
 u1 TimeSystem
 u1 Datum
 u1 NrSV
 u1 WACorrInfo
 u2 ReferenceID
 u2 MeanCorrAge
 u4 SignalInfo
 u1 AlertFlag
 u1 NrBases
 u1[2] Reserved_0


cdef packed struct PVTGeodetic_v2:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f8 Phi
 f8 Lambda
 f8 h
 f4 Undulation
 f4 Vn
 f4 Ve
 f4 Vu
 f4 COG
 f8 RxClkBias
 f4 RxClkDrift
 u1 TimeSystem
 u1 Datum
 u1 NrSV
 u1 WACorrInfo
 u2 ReferenceID
 u2 MeanCorrAge
 u4 SignalInfo
 u1 AlertFlag
 u1 NrBases
 u1[2] Reserved_0


cdef packed struct PosCovCartesian:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_xx
 f4 Cov_yy
 f4 Cov_zz
 f4 Cov_bb
 f4 Cov_xy
 f4 Cov_xz
 f4 Cov_xb
 f4 Cov_yz
 f4 Cov_yb
 f4 Cov_zb


cdef packed struct PosCovGeodetic:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_PhiPhi
 f4 Cov_LambdaLambda
 f4 Cov_hh
 f4 Cov_bb
 f4 Cov_PhiLambda
 f4 Cov_Phih
 f4 Cov_Phib
 f4 Cov_Lambdah
 f4 Cov_Lambdab
 f4 Cov_hb


cdef packed struct VelCovCartesian:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_VxVx
 f4 Cov_VyVy
 f4 Cov_VzVz
 f4 Cov_DtDt
 f4 Cov_VxVy
 f4 Cov_VxVz
 f4 Cov_VxDt
 f4 Cov_VyVz
 f4 Cov_VyDt
 f4 Cov_VzDt


cdef packed struct VelCovGeodetic:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_VnVn
 f4 Cov_VeVe
 f4 Cov_VuVu
 f4 Cov_DtDt
 f4 Cov_VnVe
 f4 Cov_VnVu
 f4 Cov_VnDt
 f4 Cov_VeVu
 f4 Cov_VeDt
 f4 Cov_VuDt


cdef packed struct DOP_v2:
 u4 TOW
 u2 WNc
 u1 NrSV
 u1 Reserved_0
 u2 PDOP
 u2 TDOP
 u2 HDOP
 u2 VDOP
 f4 HPL
 f4 VPL


cdef packed struct PosCart:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f8 X
 f8 Y
 f8 Z
 f8 Base2RoverX
 f8 Base2RoverY
 f8 Base2RoverZ
 f4 Cov_xx
 f4 Cov_yy
 f4 Cov_zz
 f4 Cov_xy
 f4 Cov_xz
 f4 Cov_yz
 u2 PDOP
 u2 HDOP
 u2 VDOP
 u1 Misc
 u1 Reserved_0
 u1 AlertFlag
 u1 Datum
 u1 NrSV
 u1 WACorrInfo
 u2 ReferenceID
 u2 MeanCorrAge
 u4 SignalInfo


cdef packed struct PVTSatCartesian:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct PVTSatCartesian_SatPos:
 u1 SVID
 u1 FreqNr
 u2 IODE
 f8 x
 f8 y
 f8 z
 f4 Vx
 f4 Vy
 f4 Vz


cdef packed struct PVTResiduals_v2:
 u4 TOW
 u2 WNc
 u1 N
 u1 SB1Length
 u1 SB2Length


cdef packed struct PVTResiduals_v2_SatSignalInfo:
 u1 SVID
 u1 FreqNr
 u1 Type
 u1 RefSVID
 u1 RefFreqNr
 u1 MeasInfo
 u2 IODE
 u2 CorrAge
 u2 ReferenceID


cdef packed struct PVTResiduals_v2_ResidualInfo:
 f4 e_i
 u2 w_i
 u2 MDB


cdef packed struct RAIMStatistics_v2:
 u4 TOW
 u2 WNc
 u1 IntegrityFlag
 u1 Reserved_0
 f4 HERL_position
 f4 VERL_position
 f4 HERL_velocity
 f4 VERL_velocity
 u2 OverallModel
 u1[2] Reserved_1


cdef packed struct GEOCorrections:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct GEOCorrections_SatCorr:
 u1 SVID
 u1 IODE
 u1[2] Reserved_0
 f4 PRC
 f4 CorrAgeFC
 f4 DeltaX
 f4 DeltaY
 f4 DeltaZ
 f4 DeltaClock
 f4 CorrAgeLT
 f4 IonoPPlat
 f4 IonoPPLon
 f4 SlantIono
 f4 CorrAgeIono
 f4 VarFLT
 f4 VarUIRE
 f4 VarAir
 f4 VarTropo


cdef packed struct BaseVectorCart:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct BaseVectorCart_VectorInfoCart:
 u1 NrSV
 u1 Error
 u1 Mode
 u1 Misc
 f8 dX
 f8 dY
 f8 dZ
 f4 dVx
 f4 dVy
 f4 dVz
 u2 Azimuth
 i2 Elevation
 u2 ReferenceID
 u2 CorrAge
 u4 SignalInfo


cdef packed struct BaseVectorGeod:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct BaseVectorGeod_VectorInfoGeod:
 u1 NrSV
 u1 Error
 u1 Mode
 u1 Misc
 f8 dEast
 f8 dNorth
 f8 dUp
 f4 dVe
 f4 dVn
 f4 dVu
 u2 Azimuth
 i2 Elevation
 u2 ReferenceID
 u2 CorrAge
 u4 SignalInfo


cdef packed struct PVTSupport:
 u4 TOW
 u2 WNc


cdef packed struct EndOfPVT:
 u4 TOW
 u2 WNc


cdef packed struct IntPVCart:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 u2 Info
 u1 NrSV
 u1 NrAnt
 u1 GNSSPVTMode
 u1 Datum
 u2 GNSSage
 f8 X
 f8 Y
 f8 Z
 f4 Vx
 f4 Vy
 f4 Vz
 f4 COG


cdef packed struct IntPVGeod:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 u2 Info
 u1 NrSV
 u1 NrAnt
 u1 GNSSPVTMode
 u1 Datum
 u2 GNSSage
 f8 Lat
 f8 Long
 f8 Alt
 f4 Vn
 f4 Ve
 f4 Vu
 f4 COG


cdef packed struct IntPosCovCart:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_xx
 f4 Cov_yy
 f4 Cov_zz
 f4 Cov_xy
 f4 Cov_xz
 f4 Cov_yz


cdef packed struct IntVelCovCart:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_VxVx
 f4 Cov_VyVy
 f4 Cov_VzVz
 f4 Cov_VxVy
 f4 Cov_VxVz
 f4 Cov_VyVz


cdef packed struct IntPosCovGeod:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_LatLat
 f4 Cov_LonLon
 f4 Cov_AltAlt
 f4 Cov_LatLon
 f4 Cov_LatAlt
 f4 Cov_LonAlt


cdef packed struct IntVelCovGeod:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_VnVn
 f4 Cov_VeVe
 f4 Cov_VuVu
 f4 Cov_VnVe
 f4 Cov_VnVu
 f4 Cov_VeVu


cdef packed struct IntAttEuler:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 u2 Info
 u1 NrSV
 u1 NrAnt
 u1 Reserved_0
 u1 Datum
 u2 GNSSage
 f4 Heading
 f4 Pitch
 f4 Roll
 f4 PitchDot
 f4 RollDot
 f4 HeadingDot


cdef packed struct IntAttCovEuler:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f4 Cov_HeadHead
 f4 Cov_PitchPitch
 f4 Cov_RollRoll
 f4 Cov_HeadPitch
 f4 Cov_HeadRoll
 f4 Cov_PitchRoll


cdef packed struct IntPVAAGeod:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 u2 Info
 u1 GNSSPVTMode
 u1 Datum
 u1 GNSSage
 u1 NrSVAnt
 u1 Reserved_0
 u1 PosFine
 i4 Lat
 i4 Long
 i4 Alt
 i4 Vn
 i4 Ve
 i4 Vu
 i2 Ax
 i2 Ay
 i2 Az
 u2 Heading
 i2 Pitch
 i2 Roll


cdef packed struct AuxAntPositions:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct AuxAntPositions_AuxAntPosition:
 u1 NrSV
 u1 Error
 u1 AmbiguityType
 u1 AuxAntID
 f8 dEast
 f8 dNorth
 f8 dUp
 f8 EastVel
 f8 NorthVel
 f8 UpVel


cdef packed struct AttEuler:
 u4 TOW
 u2 WNc
 u1 NrSV
 u1 Error
 u2 Mode
 u1 Datum
 u1 Reserved_0
 f4 Heading
 f4 Pitch
 f4 Roll
 f4 PitchDot
 f4 RollDot
 f4 HeadingDot


cdef packed struct AttCovEuler:
 u4 TOW
 u2 WNc
 u1 Reserved_0
 u1 Error
 f4 Cov_HeadHead
 f4 Cov_PitchPitch
 f4 Cov_RollRoll
 f4 Cov_HeadPitch
 f4 Cov_HeadRoll
 f4 Cov_PitchRoll


cdef packed struct EndOfAtt:
 u4 TOW
 u2 WNc


cdef packed struct ReceiverTime:
 u4 TOW
 u2 WNc
 i1 UTCYear
 i1 UTCMonth
 i1 UTCDay
 i1 UTCHour
 i1 UTCMin
 i1 UTCSec
 i1 DeltaLS
 u1 SyncLevel
 u2 Reserved_0


cdef packed struct xPPSOffset:
 u4 TOW
 u2 WNc
 u1 SyncAge
 u1 Timescale
 f4 Offset


cdef packed struct ExtEvent:
 u4 TOW
 u2 WNc
 u1 Source
 u1 Polarity
 f4 Offset
 f8 RxClkBias
 u2 PVTAge
 u1[2] Reserved_0


cdef packed struct ExtEventPVTCartesian:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f8 X
 f8 Y
 f8 Z
 f4 Undulation
 f4 Vx
 f4 Vy
 f4 Vz
 f4 COG
 f8 RxClkBias
 f4 RxClkDrift
 u1 TimeSystem
 u1 Datum
 u1 NrSV
 u1 WACorrInfo
 u2 ReferenceID
 u2 MeanCorrAge
 u4 SignalInfo
 u1 AlertFlag
 u1 NrBases
 u1[2] Reserved_0


cdef packed struct ExtEventPVTGeodetic:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Error
 f8 Phi
 f8 Lambda
 f8 h
 f4 Undulation
 f4 Vn
 f4 Ve
 f4 Vu
 f4 COG
 f8 RxClkBias
 f4 RxClkDrift
 u1 TimeSystem
 u1 Datum
 u1 NrSV
 u1 WACorrInfo
 u2 ReferenceID
 u2 MeanCorrAge
 u4 SignalInfo
 u1 AlertFlag
 u1 NrBases
 u1[2] Reserved_0


cdef packed struct DiffCorrIn:
 u4 TOW
 u2 WNc
 u1 Mode
 u1 Source
 c1* MessageContent


cdef packed struct BaseStation:
 u4 TOW
 u2 WNc
 u2 BaseStationID
 u1 BaseType
 u1 Source
 u1 Datum
 u1 Reserved_0
 f8 X
 f8 Y
 f8 Z


cdef packed struct LBandTrackerStatus:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct LBandTrackerStatus_TrackData:
 u4 Frequency
 u2 Baudrate
 u2 ServiceID
 f4 FreqOffset
 u2 CN0
 i2 AvgPower
 i1 AGCGain
 u1 Mode
 u1 Status
 u1 Reserved_0
 u2 LockTime
 u2 Reserved_1


cdef packed struct DecoderStatus:
 u4 TOW
 u2 WNc
 u2 Reserved_0
 u1 Status
 u1 Access
 u1 GeoGatingMode
 u1 GeoGatingStatus
 u4 Event


cdef packed struct LBAS1Messages:
 u4 TOW
 u2 WNc
 u2 MessageLength
 c1* Message


cdef packed struct ExtSensorMeas:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct ExtSensorMeas_MeasSet:
 u1 Source
 u1 SensorModel
 u1 Type
 u1 ObsInfo
 f8 X
 f8 Y
 f8 Z


cdef packed struct ExtSensorStatus:
 u4 TOW
 u2 WNc
 u1 Source
 u1 SensorModel
 u1 StatusType
 u1[3] Reserved_0
 u1* StatusBits


cdef packed struct ExtSensorSetup:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct ExtSensorSetup_OneSensor:
 u1 Source
 u1 SensorModel
 u2 MeasType


cdef packed struct ChannelStatus:
 u4 TOW
 u2 WNc
 u1 N1
 u1 SB1Length
 u1 SB2Length
 u1[3] Reserved_0


cdef packed struct ChannelStatus_ChannelSatInfo:
 u1 SVID
 u1 FreqNr
 u2 Reserved_0
 u2 Azimuth_RiseSet
 u2 HealthStaus
 i1 Elevation
 u1 N2
 u1 RxChannel
 u1 Reserved_1


cdef packed struct ChannelStatus_ChannelStateInfo:
 u1 Antenna
 u1 Reserved_0
 u2 TrackingStatus
 u2 PVTStatus
 u2 PVTInfo


cdef packed struct ReceiverStatus_v2:
 u4 TOW
 u2 WNc
 u1 CPULoad
 u1 ExtError
 u4 UpTime
 u4 RxState
 u4 RxError
 u1 N
 u1 SBLength
 u1[2] Reserved_0


cdef packed struct ReceiverStatus_v2_AGCData:
 u1 FrontendID
 i1 Gain
 u1 SampleVar
 u1 BlankingStat


cdef packed struct SatVisibility:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct SatVisibility_SatInfo:
 u1 SVID
 u1 FreqNr
 u2 Azimuth
 i2 Elevation
 u1 RiseSet
 u1 SatelliteInfo


cdef packed struct InputLink:
 u4 TOW
 u2 WNc
 u1 N
 u1 SBLength


cdef packed struct InputLink_InputStats:
 u1 CD
 u1 Type
 u2 AgeOfLastMessage
 u4 NrBytesReceived
 u4 NrBytesAccepted
 u4 NrMsgReceived
 u4 NrMsgAccepted


cdef packed struct OutputLink:
 u4 TOW
 u2 WNc
 u1 N1
 u1 SB1Length
 u1 SB2Length
 u1[3] Reserved_0


cdef packed struct OutputLink_OutputStats:
 u1 CD
 u1 N2
 u2 AllowedRate
 u4 NrBytesProduced
 u4 NrBytesSent
 u1 NrClients


cdef packed struct OutputLink_OutputType:
 u1 Type
 u1 Percentage
 u1[2] Reserved_0


cdef packed struct IPStatus:
 u4 TOW
 u2 WNc
 u1[6] MACAddress
 u1[16] IPAddress
 u1[16] Gateway
 u1 Netmask


cdef packed struct ReceiverSetup:
 u4 TOW
 u2 WNc
 u1[2] Reserved_0
 c1[60] MarkerName
 c1[20] MarkerNumber
 c1[20] Observer
 c1[40] Agency
 c1[20] RxSerialNumber
 c1[20] RxName
 c1[20] RxVersion
 c1[20] AntSerialNbr
 c1[20] AntType
 f4 DeltaH
 f4 DeltaE
 f4 DeltaN
 c1[20] MarkerType
 c1[40] GNSSFWVersion
 c1[40] ProductName


cdef packed struct Commands:
 u4 TOW
 u2 WNc
 u1[2] Reserved_0
 c1* CmdData


cdef packed struct Comment:
 u4 TOW
 u2 WNc
 u2 CommentLn
 c1* Comment


cdef packed struct BBSamples:
 u4 TOW
 u2 WNc
 u2 N
 u1 Info
 u1[3] Reserved_0
 u4 SampleFreq
 u4 LOFreq
 u2* Samples


cdef packed struct ASCIIIn:
 u4 TOW
 u2 WNc
 u1 CD
 u1 Reserved_0
 u2 Reserved_1
 u2 StringLn
 u1[60] Reserved_2
 c1* ASCIIString
