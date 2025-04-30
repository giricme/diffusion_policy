#!/bin/bash
set -e
CONFIG_FOLDER="diffusion_policy/config"

echo  "Running PushT with DinoBase"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_pusht_pretrained_dinov2_base.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

echo  "Running PushT with DinoLarge"
python train.py --config-dir=$CONFIG_FOLDER  --config-name=train_pusht_pretrained_dinov2_large.yaml training.seed=42 training.device=cuda:1 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'