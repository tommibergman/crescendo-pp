#!/bin/bash
if [[ -n "${1}" ]]
then
    y1=${1} 
else
    echo "usage ${0} startyear [endyear]"
    exit
fi

#if no end
[[ -n "${2}" ]] && y2=${2} || y2=${1}

if [[ ${y2} -lt ${y1} ]]
then
    echo "usage ${0} startyear [endyear]"
    echo "endyear must be larger than or equal to staryear"
    exit
fi

for yyyy in $(eval echo "{$y1..$y2}")
do
    sed  "s/yyyy/${yyyy}/g" pp_ifs_monthly.job.tmpl > pp_ifs_monthly.${yyyy}.job
    sed  "s/yyyy/${yyyy}/g" pp_ifs+tm5_merge_copy.job.tmpl > pp_ifs+tm5_merge_copy.${yyyy}.job
    echo $yyyy
done
