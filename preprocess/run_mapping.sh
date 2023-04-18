#!/bin/bash
#SBATCH --job-name=mapping
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --partition=p-A100

cd /home/luohao/SLP/singer-adaptive-svc/preprocess
conda activate py38
python extract_mcep.py