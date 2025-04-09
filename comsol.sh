#!/bin/bash
#SBATCH --cpus-per-task=40
#SBATCH --partition=iwholeq
#SBATCH --time=1:00:00
#SBATCH --mem=150G

module load comsol

comsol batch -inputfile cylinder2.mph -outputfile cylinder2-output.mph
