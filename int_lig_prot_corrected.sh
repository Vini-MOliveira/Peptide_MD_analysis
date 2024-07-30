#!/bin/bash

#module load gromacs/2022.3
module load schrodinger/2023.2
#module load amber/2020

#USAGE: ./analysis_merge.sh ADC_folder #eCys1


#Write file for being analyzed

for dir in desmond_md_job_bza_merged_water desmond_md_job_phe_60_merged_water
 
do
    cd $dir
        echo $dir
        mkdir INT_P
     
        for (( i=4 ; i<=63 ; i++ ));
        do
        #echo $i
        if [ -f "INT_P/prot_lig_${i}-out.eaf" ]; then
	    echo $i
        else
            echo "File prot_lig_${i}-out.eaf does not exist."
 #           $SCHRODINGER/run event_analysis.py analyze out_wat-out.cms -p '(protein)' -l '( res.ptype "M1  " AND (mol.num      '${i}'))' -o INT_P/prot_lig_${i}
#            $SCHRODINGER/run analyze_simulation.py out_wat-out.cms out_wat_trj INT_P/prot_lig_${i}-out.eaf INT_P/prot_lig_${i}-in.eaf -HOST sge_cpu:12 -JOBNAME "sid_${i}"
        fi
#        $SCHRODINGER/run event_analysis.py analyze out_wat-out.cms -p '(protein)' -l '( res.ptype "M1  " AND (mol.num      '${i}'))' -o INT_P/prot_lig_${i}
#        $SCHRODINGER/run analyze_simulation.py out_wat-out.cms out_wat_trj INT_P/prot_lig_${i}-out.eaf INT_P/prot_lig_${i}-in.eaf -HOST sge_cpu:24 -JOBNAME sid_${dir}_${i}
        $SCHRODINGER/run st2csv.py INT_P/prot_lig_${i}-out.eaf INT_P/prot_lig_${i}-out.csv
#        echo 'SID analysis is submitted'
       
        done
cd ../
done
