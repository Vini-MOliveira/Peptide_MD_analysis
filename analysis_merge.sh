#!/bin/bash

#module load gromacs/2022.3
module load schrodinger/2023.2
#module load amber/2020

#Write file for being analyzed
#USAGE: ./analysis file REPs

file=$1
num_rep=$2
 
mkdir ${file}_merged

for ((i=1; i<=$num_rep; i++))
do
    dir=${file}_${i}

    cd $dir
    echo $dir
    mkdir cluster
    echo "Align protein and extracting water for traj"
    $SCHRODINGER/run trj_align.py -s 400::4 -ref-frame 0 -asl "protein" ${dir}-out.cms ${dir}_trj run_aligned_extracted
    $SCHRODINGER/run trj_extract_subsystem.py -s ::1 -t run_aligned_extracted_trj -asl "protein or ligand" -whole run_aligned_extracted-out.cms run_extracted_no_wat

    echo "Generating .xtc file"
#    $SCHRODINGER/run /lrlhps/users/l034064/ADC/Script/trj_no_virt_no_reorder.py run_extracted_no_wat-out.cms run_extracted_no_wat_trj/ 

    echo "Extracting last frames"
#    $SCHRODINGER/run trj2mae.py -s 1::10 -extract-asl "((protein or ligand))" -out-format MAE run_extracted_no_wat-out.cms run_extracted_no_wat_trj/ cluster/extract

    echo "Clusterizing"
#    $SCHRODINGER/run conformer_cluster.py -HOST sge_cpu:24 -a "( backbone  ) " -n 0 -l "Ward" -rep -o clustered -OVERWRITE cluster/extract.maegz

    cd ..
done

for ((i = 1; i<=$num_rep; i++)); do
#    file_paths="${file_paths}${file}_${i}/run_aligned_extracted_trj "
     file_paths="${file_paths}${file}_${i}/run_extracted_no_wat_trj "
done

    echo "Merging trajs for replicas"
    $SCHRODINGER/run trj_merge.py  ${file}_1/run_extracted_no_wat-out.cms $file_paths -o ${file}_merged/out -concat 75 100
    cd ${file}_merged
    	$SCHRODINGER/run /lrlhps/users/l034064/ADC/Script/trj_no_virt_no_reorder.py out-out.cms out_trj/
    cd ../
