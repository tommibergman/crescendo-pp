#!/bin/bash
set -ex
year=$2
name="CRESCENDO"
temp=$((year-1999))
dd=`printf %03d $temp`
echo $temp $dd
runid="crsp"

basepath=${SCRATCH}/CRESCENDO
outdir=${basepath}/amip-pd-${yyyy}
datapath=${SCRATCH}/ECEARTH-RUNS/${runid}/output/ifs/${dd}
IFStemp=${basepath}/ifstemp/
aermon3d='AERmon'
aerday2d='AERday'
aermon2d='AERmon'
aer6hr='AER6hr'

exp='crsp'


i=$(printf %02d $1)
echo 'processing month ' $i

outdir=${IFStemp}
mkdir -p ${IFStemp}
rm -f *_${year}${i}.nc

cdo -t ecmwf -R splitzaxis -shifttime,-6hour ${datapath}/ICMGG${exp}+${year}${i} ${IFStemp}/ICMGG${exp}+${year}${i}_split
cdo -t ecmwf -R splitzaxis  -shifttime,-6hour  ${datapath}/ICMSH${exp}+${year}${i} ${IFStemp}/ICMSH${exp}+${year}${i}_split

    #aermon-2d
cdo  -t ecmwf -f nc -R expr,"tos=SSTK;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/tos_${aermon2d}_${year}${i}.nc
cdo  -t ecmwf -f nc -R expr,"sic=CI;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb  ${IFStemp}/sic_${aermon2d}_${year}${i}.nc
# upward part is  STR-STRD,but here the convention is down positive, CMIPoutput requires upwards positive
# -> rlus=-(STR-STRD)
cdo -t ecmwf -f nc -R expr,"rlus=-(STR-STRD)/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rlus_${aermon2d}_${year}${i}.nc
# upward part is  SSR-SSRD,but here the convention is down positive, CMIPoutput requires upwards positive
# -> rsus=-(SSR-SSRD)
cdo -t ecmwf -f nc -R expr,"rsus=-(SSR-SSRD)/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rsus_${aermon2d}_${year}${i}.nc

cdo -t ecmwf -f nc -R expr,"rsds=SSRD/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rsds_${aermon2d}_${year}${i}.nc
cdo  -t ecmwf -f nc -R expr,"rlds=STRD/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rlds_${aermon2d}_${year}${i}.nc
# SI-TSR(C)  
cdo  -t ecmwf -f nc -R expr,"rsutcs=(SI-TSRC)/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rsutcs_${aermon2d}_${year}${i}.nc
cdo  -t ecmwf -f nc -R expr,"rsut=(SI-TSR)/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rsut_${aermon2d}_${year}${i}.nc
# down is positive for TTRC and TTR, Upwards positive for CMIP6 -> -TTRC, -TTR
cdo  -t ecmwf -f nc -R expr,"rlutcs=-TTRC/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rlutcs_${aermon2d}_${year}${i}.nc
cdo  -t ecmwf -f nc -R expr,"rlut=-TTR/(6.0*3600.0);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/rlut_${aermon2d}_${year}${i}.nc

cdo  -t ecmwf -f nc -R expr,"uas=U10M;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/uas_${aermon2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"vas=V10M;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/vas_${aermon2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"sfcWind=sqrt(V10M*V10M+U10M*U10M);" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/sfcWind_${aermon2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"albsrf=FAL;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/albsrf_${aermon2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"pr=LSP+CP;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/pr_${aermon2d}_${year}${i}.nc
#SH
cdo -t ecmwf -f nc -R expr,"ps=exp(LNSP);" -sp2gp ${IFStemp}/ICMSH${exp}+${year}${i}_split04.grb  ${IFStemp}/ps_${aermon2d}_${year}${i}.nc
    #aer6hr-2d
cdo  -t ecmwf -f nc -R expr,"uas=U10M;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/uas_${aer6hr}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"vas=V10M;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/vas_${aer6hr}_${year}${i}.nc
#aer6hr-3d
cdo -t ecmwf -f nc -R expr,"clt=CC;" ${IFStemp}/ICMGG${exp}+${year}${i}_split07.grb ${IFStemp}/clt_${aer6hr}_${year}${i}.nc

    #aerdaily-2d
cdo -t ecmwf -f nc -R expr,"tas=T2M;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/tas_${aerday2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"tasmax=MX2T;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/tasmax_${aerday2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"tasmax=MN2T;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/tasmin_${aerday2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"precip=LSP+CP;" ${IFStemp}/ICMGG${exp}+${year}${i}_split01.grb ${IFStemp}/pr_${aerday2d}_${year}${i}.nc
cdo -t ecmwf -f nc -R expr,"sfsh=Q;" -sellevel,91 ${IFStemp}/ICMGG${exp}+${year}${i}_split07.grb ${IFStemp}/sfsh_${aerday2d}_${year}${i}.nc
cdo -t ecmwf -f nc expr,"ps=exp(LNSP);" -sp2gp ${IFStemp}/ICMSH${exp}+${year}${i}_split04.grb  ${IFStemp}/ps_${aerday2d}_${year}${i}.nc    
    #aermon-3d
cdo -t ecmwf -f nc -R expr,"clt=CC;" ${IFStemp}/ICMGG${exp}+${year}${i}_split07.grb ${IFStemp}/clt_${aermon3d}_${year}${i}.nc
#SH file
cdo -t ecmwf -f nc expr,"ua=U;" -sp2gp ${IFStemp}/ICMSH${exp}+${year}${i}_split03.grb ${IFStemp}/ua_${aermon3d}_${year}${i}.nc
cdo -t ecmwf -f nc expr,"va=V;" -sp2gp ${IFStemp}/ICMSH${exp}+${year}${i}_split03.grb ${IFStemp}/va_${aermon3d}_${year}${i}.nc
cdo -t ecmwf -f nc expr,"wa=Z;" -sp2gp ${IFStemp}/ICMSH${exp}+${year}${i}_split03.grb ${IFStemp}/wa_${aermon3d}_${year}${i}.nc


rm -f *_${year}${i}.mm.nc

for varfile in ${IFStemp}/*_AERmon_${year}${i}.nc
do
    cdo monmean $varfile  ${IFStemp}/$(basename $varfile .nc).mm.nc

done 
for varfile in ${IFStemp}/*_AERday_${year}${i}.nc
do
    cdo daymean $varfile  ${IFStemp}/$(basename $varfile .nc).mm.nc

done 

