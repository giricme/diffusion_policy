#!/bin/bash
set -e
CONFIG_FOLDER="diffusion_policy/config"

echo  "Running RealPushT with End2End"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_real_pusht.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

echo "Running RealPushT with DinoV2"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_real_pusht_pretrained_dinov2_base.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

echo "Running RealPushT with R3M"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_real_pusht_pretrained_r3m.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

echo "Running RealPushT with ImageNet"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_real_pusht_pretrained_imagenet.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

