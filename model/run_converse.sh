#!/bin/bash
#SBATCH --job-name=converse
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --partition=p-V100
#SBATCH --output=run_converse.out

# ===================== Conversion for M4Singer =====================
python -u converse.py \
--source_dataset 'M4Singer' --dataset_type 'test' \
--model_file '/mntnfs/lee_data1/haoyan/SLP/Singing-Voice-Conversion/model/ckpts/Opencpop/Transformer_lr_0.0001/104.pt' \
--target_singer_f0_file /mntnfs/lee_data1/haoyan/SLP/Singing-Voice-Conversion/preprocess/M4Singer/F0/test_f0.pkl \
--inference_dir '/mntnfs/lee_data1/haoyan/SLP/Singing-Voice-Conversion/model/ckpts/M4Singer/Transformer_eval_conversion'