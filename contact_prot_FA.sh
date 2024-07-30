#!/bin/bash

NUM_RES=39

for dir in desmond_md_job_wat_merged desmond_md_job_phe_60_merged desmond_md_job_bza_merged
do
	cd $dir
	echo $dir
	mkdir HBONDS_FA_prot
	mkdir CONTACTS_FA_prot


	$SCHRODINGER/run trajectory_asl_monitor.py out-out.cms CONTACTS_FA_prot/res_cont '( res.ptype "  * ")' '(protein and res.num 1)' '(protein and res.num 2)' '(protein and res.num 3)' '(protein and res.num 4)' '(protein and res.num 5)' '(protein and res.num 6)' '(protein and res.num 7)' '(protein and res.num 8)' '(protein and res.num 9)' '(protein and res.num 10)' '(protein and res.num 11)' '(protein and res.num 12)' '(protein and res.num 13)' '(protein and res.num 14)' '(protein and res.num 15)' '(protein and res.num 16)' '(protein and res.num 17)' '(protein and res.num 18)' '(protein and res.num 19)' '(protein and res.num 20)' '(protein and res.num 21)' '(protein and res.num 22)' '(protein and res.num 23)' '(protein and res.num 24)' '(protein and res.num 25)' '(protein and res.num 26)' '(protein and res.num 27)' '(protein and res.num 28)' '(protein and res.num 29)' '(protein and res.num 30)' '(protein and res.num 31)' '(protein and res.num 32)' '(protein and res.num 33)' '(protein and res.num 34)' '(protein and res.num 35)' '(protein and res.num 36)' '(protein and res.num 37)' '(protein and res.num 38)' '(protein and res.num 39)' -distance 3.5

	for (( i=1 ; i<=$NUM_RES ; i++ )); 
	do
    		echo $i
    		$SCHRODINGER/run trajectory_analyze_hbonds.py out-out.cms  HBONDS_FA_prot/hbond_${i}.csv 'protein and res.num '${i}'' -asl2 '(res.ptype "  * ")'
        
	done
	cd ../
done
