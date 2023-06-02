#!/bin/bash
#########################################################
# Uncomment and change the variables below to your need:#
#########################################################

# Install directory without trailing slash
install_dir="/home/$(whoami)/MachineLearning"

# Name of the subdirectory
clone_dir="stable-diffusion-webui"

# Commandline arguments for webui.py, for example: export COMMANDLINE_ARGS="--medvram --opt-split-attention"
export COMMANDLINE_ARGS="--medvram --opt-split-attention --disable-safe-unpickle --xformers --theme=dark --autolaunch"

# python3 executable
#python_cmd="python3"

# git executable
#export GIT="git"

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
#venv_dir="venv"

# script to launch to start the app
#export LAUNCH_SCRIPT="launch.py"

# install command for torch
export TORCH_COMMAND="pip install torch==2.0.0+cu118 torchvision==0.15.1+cu118 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu118"

# Requirements file to use for stable-diffusion-webui
#export REQS_FILE="requirements_versions.txt"

# Fixed git repos
#export K_DIFFUSION_PACKAGE=""
#export GFPGAN_PACKAGE=""

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to enable accelerated launch
#export ACCELERATE="True"

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################

export SADTALKER_CHECKPOINTS=models/SadTalker/checkpoints

# Creates desktop icon for the user
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ ! -e "~/.local/share/applications/stable-diffusion.desktop" ]; then
    echo $SCRIPT_DIR/webui.sh 
    cat > ~/.local/share/applications/stable-diffusion.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Stable Diffusion
Comment=Stable Diffusion is a generative AI model to generate images and videos
Type=Application
Terminal=true
Icon=${SCRIPT_DIR}/app-icon.png
Exec=${SCRIPT_DIR}/webui.sh
EOF
fi

# yea yea make a loop
if [ ! -e "~/Desktop/stable-diffusion.desktop" ]; then
    echo $SCRIPT_DIR/webui.sh 
    cat > ~/Desktop/stable-diffusion.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Stable Diffusion
Comment=Stable Diffusion is a generative AI model to generate images and videos
Type=Application
Terminal=true
Icon=${SCRIPT_DIR}/app-icon.png
Exec=${SCRIPT_DIR}/webui.sh
EOF
fi