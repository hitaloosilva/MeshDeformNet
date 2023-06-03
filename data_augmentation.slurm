#!/bin/bash
#SBATCH --partition=long_gpu
#SBATCH --job-name=HOS_AUGM
#SBATCH --nodes=1            # total number of nodes (N to be defined)
#SBATCH --ntasks-per-node=4 # number of tasks per node (here 4, or 1 task per reserved GPU)
#SBATCH --gres=gpu:2        # number of GPUs reserved per node (here 4, or all the GPUs of a node)
#SBATCH --cpus-per-task=4    # number of cores per task (here, we reserve 4x10 = 40 cores per node)
#SBATCH --mem=32G
#SBATCH --output=/home/cfilho/hitalo/MeshDeformNet/output_folder/output_augment.log

# Aqui o comando de execução de seu programa.
module load cuda-10.2-gcc-8.3.0-nxzzh52
module load singularity-3.6.2-gcc-8.3.0-quskioo

singularity exec --nv mesh_cont python3.6 data/data_augmentation.py --im_dir  ../data_heart/ct_train --seg_dir  ../data_heart/ct_train_seg --out_dir  ../data_heart/augm --modality ct --mode train --num 10