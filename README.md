# Introduction
COMSOL scripting on the cluster requires you to setup an MPH file short of solving it (including outputs). Just upload your data, scripts, and submission script (see comsol.sh for example) to the cluster, and submit with sbatch. To use the following example, run:
```
git clone https://github.com/uofm-research-computing/bigblue_comsol.git
cd bigblue_comsol
```

# Submission
The cylinder example provided can be copied with the following command on the cluster:
```
cp /opt/ohpc/pub/apps/uofm/comsol/testFiles/cylinder2.mph ./
```
Once you have your data in a job directory setup on the cluster, you can decide on how to use comsol.

## Multiple CPU-cores
If your job is relatively small, you might use multiple CPU-cores on a single node. Use `--cpus-per-task` and `--mem` or `--mem-per-cpu` to the appropriate resources required for you job. Then, in the submission script, use the appropriate COMSOL version (`module load comsol` for the latest version) and add a call to your script (such as `comsol -inputfile cylinder2.mph -outputfile cylinder2-output.mph `). Then just submit the job with:
```
sbatch comsol.sh
```

Using the iwholeq or awholeq partitions require using all 40 or 192 CPU-cores respectively. The more CPU-cores or memory you allocate, the longer your job might stay in the queue.

## Multiple Nodes
If your job takes too long or too much memory, you can use multiple nodes with comsol's built in MPI functionality. The provided script `comsol_mpi.sh` can be submitted simply with:
```
sbatch comsol_mpi.sh
```

The difference between the multiple CPU-cores and MPI version in the submission script is using `--ntasks-per-node` and `--nodes` in place of `--cpus-per-task`. Also, `--mem-per-cpu` should be used in place of `--mem`. Additionally, the comsol command requires a few extra options such as `-mpibootstrap` and `-nnhost` to be set to "slurm" and "$SLURM_NTASKS_PER_NODE", respectively. `-batchlog` can optionally be set if you want to separate the bash and comsol output. See [Comsol knowledgebase article 1001](https://www.comsol.com/support/knowledgebase/1001) for more information.
