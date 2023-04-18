#!/bin/bash
#SBATCH --job-name=train
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --partition=p-V100


cd /home/luohao/SLP/singer-adaptive-svc/model

python -u main.py --debug False \
--dataset 'Opencpop' --model 'Transformer' \
--lr 1e-4 --batch_size 32 --epochs 500