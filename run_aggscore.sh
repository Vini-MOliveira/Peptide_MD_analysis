#!/bin/bash

#module load gromacs/2022.3
module load schrodinger/2023.2
#module load amber/2020

#file=desmond_md_job_phe_10

for dir in desmond_md_job_60_merged

do
    cd $dir
#    mkdir all_frames_ligand
#    mkdir all_frames
#    mkdir all_pres
#    mkdir all_FA
    echo $dir

#    echo "Generating .xtc file"
#    $SCHRODINGER/run /lrlhps/users/l034064/ADC/Script/trj_no_virt_no_reorder.py out-out.cms out_trj/


    $SCHRODINGER/run trj2mae.py -s ::10 -extract-asl "(protein or ligand)" -out-format MAE out-out.cms out_trj/ all_frames_ligand/extract -separate
#    $SCHRODINGER/run trj2mae.py -s ::10 -extract-asl "(protein)" -out-format MAE out-out.cms out_trj/ all_frames/extract -separate
#    $SCHRODINGER/run trj2mae.py -s ::10 -extract-asl '(protein or res.ptype "M1  ")' -out-format MAE out-out.cms out_trj/ all_pres/extract -separate
#    $SCHRODINGER/run trj2mae.py -s ::10 -extract-asl '(protein or (res.ptype "  * "))' -out-format MAE out-out.cms out_trj/ all_FA/extract -separate

    cd all_frames_ligand
    for i in `seq 0 300`
    do
        echo $i
       $SCHRODINGER/run -FROM psp protein_patch_calculation.py "extract_"$i".maegz" -j $i -HOST sge_cpu:8
    done
    cd ../

#    cd all_FA
#    for i in `seq 0 300`
#    do
#        echo $i
#       $SCHRODINGER/run -FROM psp protein_patch_calculation.py "extract_"$i".maegz" -j $i -HOST sge_cpu:8
#    done
    cd ../

#    cd all_pres
#    for i in `seq 0 120`
#    do
#        echo $i
#       $SCHRODINGER/run -FROM psp protein_patch_calculation.py "extract_"$i".maegz" -j $i -HOST sge_cpu:8
#    done

#    cd ../
    cd ../
done
