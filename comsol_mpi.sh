#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=4
#SBATCH --partition=icomputeq
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=2G

module load comsol

comsol batch -mpibootstrap slurm -nnhost ${SLURM_NTASKS_PER_NODE} -inputfile cylinder2.mph -outputfile cylinder2-output.mph -batchlog job.log
