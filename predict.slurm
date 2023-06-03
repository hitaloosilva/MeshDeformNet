#!/bin/bash
#SBATCH --partition=long_gpu
#SBATCH --job-name=HOS_VALID
#SBATCH --nodes=1            # total number of nodes (N to be defined)
#SBATCH --ntasks-per-node=4 # number of tasks per node (here 4, or 1 task per reserved GPU)
#SBATCH --gres=gpu:2        # number of GPUs reserved per node (here 4, or all the GPUs of a node)
#SBATCH --cpus-per-task=4    # number of cores per task (here, we reserve 4x10 = 40 cores per node)
#SBATCH --mem=32G
#SBATCH --output=/home/cfilho/hitalo/MeshDeformNet/output_folder/output_valid.log

# Aqui o comando de execução de seu programa.
module load cuda-10.2-gcc-8.3.0-nxzzh52
module load singularity-3.6.2-gcc-8.3.0-quskioo

#singularity exec --nv mesh_cont python3.6 prediction_gcn.py --image ../data  --mesh_txt  data/template2/mesh_info_ct.txt --mesh_dat data/template2/data_aux.dat --output output_folder/ --attr _test --mesh_tmplt  data/template/init3.vtk --model output_folder/weights_gcn.hdf5 --output output_infer --modality ct --seg_id 1 --size 128 128 128 --mode validate

singularity exec --nv mesh_cont python3.6 prediction_gcn.py --image ../data_heart/  --mesh_txt  data/template3/mesh_info_ct.txt --mesh_dat data/template3/data_aux.dat --output output_folder/ --attr _test --mesh_tmplt  data/template3/init3.vtk --model output_folder/weights_gcn.hdf5 --output output_infer --modality ct --seg_id 1 2 3 4 5 6 7 --size 128 128 128 --mode test