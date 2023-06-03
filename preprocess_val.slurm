#!/bin/bash
#SBATCH --partition=long_gpu
#SBATCH --job-name=HOS3D_UNET
#SBATCH --nodes=1            # total number of nodes (N to be defined)
#SBATCH --ntasks-per-node=4 # number of tasks per node (here 4, or 1 task per reserved GPU)
#SBATCH --gres=gpu:2         # number of GPUs reserved per node (here 4, or all the GPUs of a node)
#SBATCH --cpus-per-task=4    # number of cores per task (here, we reserve 4x10 = 40 cores per node)
#SBATCH --mem=16G
#SBATCH --output=/home/cfilho/hitalo/MeshDeformNet/output_folder/output.log

# Aqui o comando de execução de seu programa.
module load cuda-11.0-gcc-8.3.0-fzbvcxy
module load singularity-3.6.2-gcc-8.3.0-quskioo

#singularity exec --nv mesh_cont python3.6 data/data2tfrecords.py --folder ../data --modality ct --size 128 128 128 --folder_postfix _val --deci_rate 0  --smooth_ite 50 --out_folder ../preprocess_data_mesh --seg_id 1 

singularity exec --nv mesh_cont python3.6 data/data2tfrecords.py --folder ../data_heart --modality ct mr --size 128 128 128 --folder_postfix _val --deci_rate 0  --smooth_ite 50 --out_folder ../preprocess_data_mesh_h --seg_id 1 2 3 4 5 6 7