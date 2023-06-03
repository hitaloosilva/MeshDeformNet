#!/bin/bash
#SBATCH --partition=long_gpu
#SBATCH --job-name=HOS_MESH
#SBATCH --nodes=1            # total number of nodes (N to be defined)
#SBATCH --ntasks-per-node=4  # number of tasks per node (here 4, or 1 task per reserved GPU)
#SBATCH --gres=gpu:2         # number of GPUs reserved per node (here 4, or all the GPUs of a node)
#SBATCH --cpus-per-task=4    # number of cores per task (here, we reserve 4x10 = 40 cores per node)
#SBATCH --mem=32G
#SBATCH --output=/home/cfilho/hitalo/MeshDeformNet/output_folder/output_new.log

# Aqui o comando de execução de seu programa.
#module load cuda-10.2-gcc-8.3.0-nxzzh52
#module load singularity-3.6.2-gcc-8.3.0-quskioo

#singularity exec --nv mesh_cont python3.6 train_gcn.py --im_trains ../preprocess_data_mesh/  --im_vals ../preprocess_data_mesh/ --mesh_txt  data/template2/mesh_info_ct.txt --mesh data/template2/data_aux.dat --attr_trains '' --attr_vals '' --train_data_weights 1. --val_data_weights 1. --output output_folder/ --modality ct --num_epoch 500 --batch_size 1 --lr 0.001 --size 128 128 128 --weights 0.29336324 0.05 0.46902252 0.16859047 --mesh_ids 0 1 2 3 4 5 6 --num_seg 1 --seg_weight 100.

#singularity exec --nv mesh_cont python3.6 train_gcn.py --im_trains ../preprocess_data_mesh_h/  --im_vals ../preprocess_data_mesh_h/ --mesh_txt  data/template_new/mesh_info_ct.txt data/template_new/mesh_info_mr.txt --mesh data/template_new/data_aux.dat --attr_trains '' --attr_vals '' --train_data_weights 1. --val_data_weights 1. --output output_folder_new/ --modality ct --num_epoch 500 --batch_size 1 --lr 0.001 --size 128 128 128 --weights 0.29336324 0.05 0.46902252 0.16859047 --mesh_ids 0 1 2 3 4 5 6 --num_seg 1 --seg_weight 100.

#local
source /media/hitalo/files/Doutorado/env/bin/activate
python train_gcn.py --im_trains ../datasets/preprocess_data_mesh_h/  --im_vals ../datasets/preprocess_data_mesh_h/ --mesh_txt  data/template_new/mesh_info_ct.txt --mesh data/template_new/data_aux.dat --attr_trains '' --attr_vals '' --train_data_weights 1. --val_data_weights 1. --output output_folder_new/ --modality ct --num_epoch 500 --batch_size 1 --lr 0.001 --size 128 128 128 --weights 0.29336324 0.05 0.46902252 0.16859047 --mesh_ids 0 1 2 3 4 5 6 --num_seg 1 --seg_weight 100.