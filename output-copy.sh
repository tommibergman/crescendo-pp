#!/bin/bash
set -ex
#run year
yyyy=$1

# id needed for reading data ${SCRATCH}/ECEARTH-RUNS/${runid}
runid=crsp

#basepath, tarfile directory
basepath=${SCRATCH}/CRESCENDO

# upload directory
outdir=${basepath}/amip-pd-${yyyy}
mkdir -p ${outdir}

# calculate the directory name, for CRESCENDO 2000 equals 001
temp=$((yyyy-1999))
dd=`printf %03d $temp`
echo $temp $dd

#reading data from here
datapath=${SCRATCH}/ECEARTH-RUNS/${runid}/output/tm5/${dd}/

#IFS
#cp ${datapath}/tos* ${outdir}/
#cp ${datapath}/sic* ${outdir}/
#cp ${datapath}/rsut* ${outdir}/
#cp ${datapath}/rsutcs* ${outdir}/
#cp ${datapath}/rlut* ${outdir}/
#cp ${datapath}/rlutcs* ${outdir}/
#cp ${datapath}/rsds* ${outdir}/
#cp ${datapath}/rsus* ${outdir}/
#cp ${datapath}/rlds* ${outdir}/
#cp ${datapath}/rlus* ${outdir}/
#sfcWind
#cp ${datapath}/albsrfc* ${outdir}/
#cp ${datapath}/ps* ${outdir}/
#cp ${datapath}/tas* ${outdir}/
#clt
#ua
#va
#wa
#cp ${datapath}/pr* ${outdir}/
#daily2d
#cp ${datapath}/ps* ${outdir}/
#cp ${datapath}/tas* ${outdir}/
#tasmin
#tasmax
#cp ${datapath}/pr* ${outdir}/
#mon2d
#uas
#vas
#6hr2d
#uas
#vas
#TM5
#ls ${datapath}
#mon2d
cp ${datapath}/ptp_AERmon_* ${outdir}/
cp ${datapath}/tatp_AERmon_* ${outdir}/
cp ${datapath}/ztp_AERmon_* ${outdir}/
cp ${datapath}/bldep_AERmon_* ${outdir}/
cp ${datapath}/pr_AERmon_* ${outdir}/
#cp ${datapath}/lai_AERmon_* ${outdir}/
#cp ${datapath}/cnpz_AERmon_* ${outdir}/
#cp ${datapath}/snc_AERmon_* ${outdir}/
cp ${datapath}/toz_AERmon_* ${outdir}/
cp ${datapath}/tropoz_AERmon_* ${outdir}/
cp ${datapath}/dryo3_AERmon_* ${outdir}/
cp ${datapath}/od550aer_AERmon_* ${outdir}/
cp ${datapath}/od870aer_AERmon_* ${outdir}/
cp ${datapath}/od440aer_AERmon_* ${outdir}/
cp ${datapath}/od550so4_AERmon_* ${outdir}/
cp ${datapath}/od550bc_AERmon_* ${outdir}/
cp ${datapath}/od550oa_AERmon_* ${outdir}/
cp ${datapath}/od550soa_AERmon_* ${outdir}/
cp ${datapath}/od550no3_AERmon_* ${outdir}/
cp ${datapath}/od550ss_AERmon_* ${outdir}/
cp ${datapath}/od550dust_AERmon_* ${outdir}/
cp ${datapath}/od550aerh2o_AERmon_* ${outdir}/
cp ${datapath}/emioa_AERmon_* ${outdir}/
cp ${datapath}/dryoa_AERmon_* ${outdir}/
cp ${datapath}/wetoa_AERmon_* ${outdir}/
cp ${datapath}/emiso2_AERmon_* ${outdir}/
cp ${datapath}/emiso4_AERmon_* ${outdir}/
cp ${datapath}/emidms_AERmon_* ${outdir}/
cp ${datapath}/dryso2_AERmon_* ${outdir}/
cp ${datapath}/dryso4_AERmon_* ${outdir}/
cp ${datapath}/wetso4_AERmon_* ${outdir}/
cp ${datapath}/wetso2_AERmon_* ${outdir}/
cp ${datapath}/eminh3_AERmon_* ${outdir}/
cp ${datapath}/drynh3_AERmon_* ${outdir}/
cp ${datapath}/drynh4_AERmon_* ${outdir}/
cp ${datapath}/wetnh4_AERmon_* ${outdir}/
cp ${datapath}/wetnh3_AERmon_* ${outdir}/
cp ${datapath}/eminox_AERmon_* ${outdir}/
#cp ${datapath}/emianox_AERmon_* ${outdir}/
cp ${datapath}/drynoy_AERmon_* ${outdir}/
cp ${datapath}/wetnoy_AERmon_* ${outdir}/
cp ${datapath}/emiss_AERmon_* ${outdir}/
cp ${datapath}/dryss_AERmon_* ${outdir}/
cp ${datapath}/wetss_AERmon_* ${outdir}/
cp ${datapath}/emidust_AERmon_* ${outdir}/
cp ${datapath}/drydust_AERmon_* ${outdir}/
cp ${datapath}/wetdust_AERmon_* ${outdir}/
cp ${datapath}/emico_AERmon_* ${outdir}/
cp ${datapath}/emibvoc_AERmon_* ${outdir}/
cp ${datapath}/emiisop_AERmon_* ${outdir}/
cp ${datapath}/albsrfc_AERmon_* ${outdir}/

cp ${datapath}/dryno3_AERmon_* ${outdir}/

#aer6hr3d
#cp ${datapath}/bs550aer_AERmon_* ${outdir}/
cp ${datapath}/ec550aer_AER6hr* ${outdir}/
#hour2d
cp ${datapath}/ps_AERhr* ${outdir}/
cp ${datapath}/tas_AERhr* ${outdir}/
cp ${datapath}/sfo3_AERhr* ${outdir}/
cp ${datapath}/sfpm25_AERhr* ${outdir}/
cp ${datapath}/sfno2_AERhr* ${outdir}/

#day2d
cp ${datapath}/sfo3max_AERday* ${outdir}/
cp ${datapath}/tas_AERday* ${outdir}/
#missing ps
#cp ${datapath}/ps_AERday* ${outdir}/
cdo daymean  ${datapath}/ps_AERhr_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01010000-${yyyy}01012359.nc  ${outdir}/ps_AERday_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}0101-${yyyy}1231.nc
cp ${datapath}/tasmin_AERday* ${outdir}/
cp ${datapath}/tasmax_AERday* ${outdir}/
cp ${datapath}/pr_AERday* ${outdir}/
cp ${datapath}/od550aer_AERday* ${outdir}/

#mon3d
cp ${datapath}/pfull_AERmon_* ${outdir}/
cp ${datapath}/phalf_AERmon_* ${outdir}/
cp ${datapath}/ta_AERmon_* ${outdir}/
cp ${datapath}/hus_AERmon_* ${outdir}/
cp ${datapath}/zg_AERmon_* ${outdir}/
cp ${datapath}/ua_AERmon_* ${outdir}/
cp ${datapath}/va_AERmon_* ${outdir}/
cp ${datapath}/wa_AERmon_* ${outdir}/
cp ${datapath}/o3_AERmon_* ${outdir}/
cp ${datapath}/o3ste_AERmon_* ${outdir}/
cp ${datapath}/ch4_AERmon_* ${outdir}/
#cp ${datapath}/co2_AERmon_* ${outdir}/
cp ${datapath}/co_AERmon_* ${outdir}/
cp ${datapath}/no2_AERmon_* ${outdir}/
cp ${datapath}/no_AERmon_* ${outdir}/
cp ${datapath}/oh_AERmon_* ${outdir}/
cp ${datapath}/mmrpm10_AERmon_* ${outdir}/
cp ${datapath}/mmrpm2p5_AERmon_* ${outdir}/

#cp ${datapath}/photo1d_AERmon_* ${outdir}/
cp ${datapath}/jno2_AERmon_* ${outdir}/
cp ${datapath}/airmass_AERmon_* ${outdir}/
cp ${datapath}/mmraerh2o_AERmon_* ${outdir}/
cp ${datapath}/mmroa_AERmon_* ${outdir}/
cp ${datapath}/mmrsoa_AERmon_* ${outdir}/
cp ${datapath}/mmrbc_AERmon_* ${outdir}/
cp ${datapath}/mmrso4_AERmon_* ${outdir}/
cp ${datapath}/mmrno3_AERmon_* ${outdir}/
cp ${datapath}/mmrnh4_AERmon_* ${outdir}/
cp ${datapath}/mmrss_AERmon_* ${outdir}/
cp ${datapath}/mmrdust_AERmon_* ${outdir}/
cp ${datapath}/so2_AERmon_* ${outdir}/
#molecweight wrong nacl instead of isop
#multiply with xmnacl/xmisop
#cp ${datapath}/isop_AERmon_* ${outdir}/
cdo expr,'isop=isop*58.443/68.11895;' ${datapath}/isop_AERmon_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01-${yyyy}12.nc ${outdir}/isop_AERmon_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01-${yyyy}12.nc
#ch2o=hcho
#cp ${datapath}/hcho_AERmon_* ${outdir}/
#cp ${datapath}/ch2o_AERmon_* ${outdir}/
cdo expr,'hcho=ch2o;' ${datapath}/ch2o_AERmon_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01-${yyyy}12.nc ${outdir}/hcho_AERmon_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01-${yyyy}12.nc
cp ${datapath}/dms_AERmon_* ${outdir}/
cp ${datapath}/hno3_AERmon_* ${outdir}/
cp ${datapath}/pan_AERmon_* ${outdir}/
cp ${datapath}/emilnox_AERmon_* ${outdir}/
cp ${datapath}/chegpso4_AERmon_* ${outdir}/
cp ${datapath}/cheaqpso4_AERmon_* ${outdir}/
cp ${datapath}/o3prod_AERmon_* ${outdir}/
cp ${datapath}/o3loss_AERmon_* ${outdir}/
#missing in crescendo branch
#cp ${datapath}/lossch4_AERmon_* ${outdir}/
#fixed only available at the start of the run
if [ ${yyyy} -eq "2000" ] 
then

    cp ${datapath}/areacella_AERfx_* ${outdir}/
    cdo chname,sftlf,land_area_fraction ${datapath}/sftlf_AERfx_EC-Earth3-AerChem_id00_r1i1p1f1_gn.nc ${outdir}/land_area_fraction_AERfx_EC-Earth3-AerChem_id00_r1i1p1f1_gn.nc
    cdo chname,orog,surface_altitude ${datapath}/orog_AERfx_EC-Earth3-AerChem_id00_r1i1p1f1_gn.nc ${outdir}/surface_altitude_AERfx_EC-Earth3-AerChem_id00_r1i1p1f1_gn.nc
fi
cp ${datapath}/*_crescendo_* ${outdir}/
rm -f ${outdir}/co_cre*
#initially crescendo co has -1 as the molecular weight, to correct:
cdo  expr,'co=-co/28.0109;' ${datapath}/co_crescendo_AERday_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}0101-${yyyy}1231.nc  ${outdir}/co_crescendo_AERday_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}0101-${yyyy}1231.nc 
#Change the name 
cdo  expr,'chepsoa=chepsoa3d;' ${datapath}/chepsoa3d_crescendo_AERmon_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01-${yyyy}12.nc  ${outdir}/chepsoa_crescendo_AERmon_EC-Earth3-AerChem_id00_r1i1p1f1_gn_${yyyy}01-${yyyy}12.nc 

rm  -f ${outdir}/co2mass_cre*
rm  -f ${outdir}/chepsoa3d_cre*
# wrong and not in the request
rm  -f ${outdir}/chepsoa2d_cre*
cd ${basepath}
tar vfcz amip-pd-${yyyy}.tar.gz amip-pd-${yyyy}
##
#JASMINPATH
#scp amip-pd-${yyyy}.tar.gz ${JASMIN}:${JASMINPATH}
cd -
