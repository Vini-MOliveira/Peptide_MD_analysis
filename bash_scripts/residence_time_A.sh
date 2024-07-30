#!/bin/bash

NUM_RES=39

for dir in desmond_md_job_bza_merged_full
do
	cd $dir
	echo $dir
	mkdir residence_A
    
        for (( i=4 ; i<=64 ; i++ ));
        do
        echo $i
        
        mkdir residence_A/pres_num_${i} 
	$SCHRODINGER/run trajectory_asl_monitor.py out-out.cms residence_A/pres_num_${i}/residence '( res.ptype "M1  " AND (mol.num      '${i}'))' '(protein and chain.name A and res.num 1)' '(protein and chain.name A and res.num 2)' '(protein and chain.name A and res.num 3)' '(protein and chain.name A and res.num 4)' '(protein and chain.name A and res.num 5)' '(protein and chain.name A and res.num 6)' '(protein and chain.name A and res.num 7)' '(protein and chain.name A and res.num 8)' '(protein and chain.name A and res.num 9)' '(protein and chain.name A and res.num 10)' '(protein and chain.name A and res.num 11)' '(protein and chain.name A and res.num 12)' '(protein and chain.name A and res.num 13)' '(protein and chain.name A and res.num 14)' '(protein and chain.name A and res.num 15)' '(protein and chain.name A and res.num 16)' '(protein and chain.name A and res.num 17)' '(protein and chain.name A and res.num 18)' '(protein and chain.name A and res.num 19)' '(protein and chain.name A and res.num 20)' '(protein and chain.name A and res.num 21)' '(protein and chain.name A and res.num 22)' '(protein and chain.name A and res.num 23)' '(protein and chain.name A and res.num 24)' '(protein and chain.name A and res.num 25)' '(protein and chain.name A and res.num 26)' '(protein and chain.name A and res.num 27)' '(protein and chain.name A and res.num 28)' '(protein and chain.name A and res.num 29)' '(protein and chain.name A and res.num 30)' '(protein and chain.name A and res.num 31)' '(protein and chain.name A and res.num 32)' '(protein and chain.name A and res.num 33)' '(protein and chain.name A and res.num 34)' '(protein and chain.name A and res.num 35)' '(protein and chain.name A and res.num 36)' '(protein and chain.name A and res.num 37)' '(protein and chain.name A and res.num 38)' '(protein and chain.name A and res.num 39)' -distance 3.5

        
	done
	cd ../
done
