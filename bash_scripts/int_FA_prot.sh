#!/bin/bash

#module load gromacs/2022.3
module load schrodinger/2023.2
#module load amber/2020

#USAGE: ./analysis_merge.sh ADC_folder #eCys1


#Write file for being analyzed

for dir in desmond_md_job_phe_60_merged desmond_md_job_bza_merged desmond_md_job_wat_merged

do
    cd $dir

    $SCHRODINGER/run event_analysis.py analyze out-out.cms -p '(protein)' -l '( ( res.ptype "  * ") AND (chain.name A))' -o prot_FA_A
    $SCHRODINGER/run analyze_simulation.py out-out.cms out_trj prot_FA_A-out.eaf prot_FA_A-in.eaf -HOST sge_cpu:24 -JOBNAME sid_${dir}
#    $SCHRODINGER/run st2csv.py C${2}_sid-out.eaf C${2}_sid-out.csv
    echo 'SID analysis is submitted'
    cd ../
done
