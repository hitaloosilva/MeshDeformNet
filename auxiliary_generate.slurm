#!/bin/bash
#SBATCH --partition=long_gpu
#SBATCH --job-name=HOS_AUX_GEN
#SBATCH --nodes=1            # total number of nodes (N to be defined)
#SBATCH --ntasks-per-node=4 # number of tasks per node (here 4, or 1 task per reserved GPU)
#SBATCH --gres=gpu:2         # number of GPUs reserved per node (here 4, or all the GPUs of a node)
#SBATCH --cpus-per-task=4    # number of cores per task (here, we reserve 4x10 = 40 cores per node)
#SBATCH --mem=16G
#SBATCH --output=/home/cfilho/hitalo/MeshDeformNet/output_folder/output_aux.log

# Aqui o comando de execução de seu programa.
#module load cuda-11.0-gcc-8.3.0-fzbvcxy
#module load singularity-3.6.2-gcc-8.3.0-quskioo

#singularity exec --nv mesh_cont python3.6 data/make_auxiliary_dat_file.py --template_fn data/template_new/init3.stl --num_meshes 7 --output data/template_new/

#local
source /media/hitalo/files/Doutorado/env/bin/activate
python data/make_auxiliary_dat_file.py --template_fn data/template_new/init3.stl --num_meshes 7 --output data/template_new/