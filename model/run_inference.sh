#!/bin/bash
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --partition=p-V100
#SBATCH --output=run_inference.out

# ===================== Inference for M4Singer =====================
python -u main.py --debug False --evaluate True \
--dataset 'M4Singer' --converse True --model 'Transformer' \
--resume '/mntnfs/lee_data1/haoyan/SLP/Singing-Voice-Conversion/model/ckpts/Opencpop/Transformer_lr_0.0001/104.pt'