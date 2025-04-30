#!/bin/bash
set -e
CONFIG_FOLDER="diffusion_policy/config"

echo  "Running Can lift with DinoBase"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_robomimic_dinov2.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

echo  "Running Can lift with End2End"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_robomimic.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

echo  "Running Can lift with R3M"
python train.py --config-dir=$CONFIG_FOLDER --config-name=train_robomimic_r3m.yaml training.seed=42 training.device=cuda:0 hydra.run.dir='data/outputs/${now:%Y.%m.%d}/${now:%H.%M.%S}_${name}_${task_name}'

