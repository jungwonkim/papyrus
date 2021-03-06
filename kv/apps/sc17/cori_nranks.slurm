#!/bin/bash -l

#SBATCH -C haswell
#SBATCH -p regular
#SBATCH -N 1
#SBATCH -t 04:00:00
#SBATCH -L SCRATCH,project
#SBATCH -J nranks
#DW jobdw capacity=1TB access_mode=striped type=scratch

module load PrgEnv-intel

export MPICH_MAX_THREAD_SAFETY=multiple
export MPICH_VERSION_DISPLAY=1

KEYLEN=16
VALLEN=131072
COUNT=1000
RANKS=(1 2 4 8 16 32)

export PAPYRUSKV_REPOSITORY=$DW_JOB_STRIPED/pkv_nranks
export PAPYRUSKV_DESTROY_REPOSITORY=1

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=1
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT put
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=2
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=32
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=32
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=2
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_REPOSITORY=$SCRATCH/pkv_nranks
export PAPYRUSKV_DESTROY_REPOSITORY=1

rm -rf $PAPYRUSKV_REPOSITORY

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=1
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT put
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT put 
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=2
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=32
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=2
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_REPOSITORY=$GPFS/pkv_nranks
export PAPYRUSKV_DESTROY_REPOSITORY=1

rm -rf $PAPYRUSKV_REPOSITORY

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=1
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT put
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=1
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT put 
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=1
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=2
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

export PAPYRUSKV_GROUP_SIZE=32
export PAPYRUSKV_CONSISTENCY=2
export PAPYRUSKV_SSTABLE=2
export PAPYRUSKV_CACHE_LOCAL=0
export PAPYRUSKV_CACHE_REMOTE=0
export PAPYRUSKV_BLOOM=1
for i in "${RANKS[@]}"; do
    srun -n $i -c 2 ./basic $KEYLEN $VALLEN $COUNT
    sleep 5
done

