#!/bin/bash

#SBATCH --time=02:00:00
#SBATCH -N 2 -n 2
#SBATCH --mem-per-cpu=16G
#SBATCH --job-name="topicGeneration"

module load Python
module load scikit-learn
pip install spacy
pip install openreview-py
python -m spacy download en_core_web_md

cp topicCluster.py $PFSDIR
cp topicslist.csv $PFSDIR
cd $PFSDIR
python topicCluster.py
cp * $SLURM_SUBMIT_DIR
