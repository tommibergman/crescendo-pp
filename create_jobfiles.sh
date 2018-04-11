#!/bin/bash

for yyyy in {2000..2014}
do
    sed  "s/yyyy/${yyyy}/g" pp_ifs_monthly.job.tmpl > pp_ifs_monthly.${yyyy}.job
    sed  "s/yyyy/${yyyy}/g" pp_ifs+tm5_merge_copy.job.tmpl > pp_ifs+tm5_merge_copy.${yyyy}.job
    echo $yyyy
done
