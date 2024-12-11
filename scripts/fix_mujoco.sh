#!/bin/bash
set -e

echo "Activating environment..."
eval "$(conda shell.bash hook)"

mamba activate robodiff
mamba install -c conda-forge glew
mamba install -c conda-forge mesalib
mamba install -c anaconda mesa-libgl-cos6-x86_64
mamba install -c menpo glfw3

conda env config vars set MUJOCO_GL=egl PYOPENGL_PLATFORM=egl
conda deactivate && conda activate robodiff

pip install patchelf

echo "Adding environment variable to bashrc"
#!/usr/bin/env bash

# Lines to add
LINES=(
'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/portegak/.mujoco/mujoco210/bin'
'#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia'
'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/miniforge3/envs/robodiff/include'
)

BASHRC="$HOME/.bashrc"

# Check if each line already exists in .bashrc, if not, append it
for LINE in "${LINES[@]}"; do
    # Escape special characters for grep
    ESCAPED_LINE=$(printf '%s\n' "$LINE" | sed 's/[][\.*^$(){}?+|]/\\&/g')

    if ! grep -qxF "$LINE" "$BASHRC" 2>/dev/null; then
        echo "$LINE" >> "$BASHRC"
        echo "Added: $LINE"
    else
        echo "Already present: $LINE"
    fi
done

echo "Done. To apply changes, run: source $BASHRC"
