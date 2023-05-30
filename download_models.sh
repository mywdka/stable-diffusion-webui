#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# STABLE DIFFUSION
SD_MODELS=(
    "https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt"
    "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    "https://huggingface.co/stabilityai/stable-diffusion-2-1-base/resolve/main/v2-1_512-ema-pruned.ckpt"
    "https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt"
    "https://huggingface.co/runwayml/stable-diffusion-inpainting/resolve/main/sd-v1-5-inpainting.ckpt"
    "https://huggingface.co/timbrooks/instruct-pix2pix/resolve/main/instruct-pix2pix-00-22000.safetensors"
    "https://huggingface.co/prompthero/openjourney/resolve/main/mdjrny-v4.ckpt" # 'mdjrny-v4 style' in prompt
)
echo "Downloading Stable Diffusion models..."
echo ""

cd ${SCRIPT_DIR}/models/Stable-diffusion
for model in ${SD_MODELS[@]}; do
  wget -nv -nc $model   
done
wget -nv -nc https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference.yaml -O v2-1_512-ema-pruned.yaml
wget -nv -nc https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt -O v2-1_768-ema-pruned.yaml

cd ${SCRIPT_DIR}

# SADTALKER
SADTALKER_MODELS=(
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/auido2exp_00300-model.pth"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/auido2pose_00140-model.pth"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/epoch_20.pth"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/facevid2vid_00189-model.pth.tar"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/shape_predictor_68_face_landmarks.dat"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/wav2lip.pth"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/mapping_00229-model.pth.tar"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/mapping_00109-model.pth.tar"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/BFM_Fitting.zip"
    "https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/hub.zip"
)

GFPGAN_MODELS=(
    "https://github.com/xinntao/facexlib/releases/download/v0.1.0/alignment_WFLW_4HG.pth"
    "https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth"
    "https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.4.pth"
    "https://github.com/xinntao/facexlib/releases/download/v0.2.2/parsing_parsenet.pth"
)
echo "Downloading SadTalker models..."
echo ""
mkdir -p ${SCRIPT_DIR}/models/SadTalker/checkpoints
mkdir -p ${SCRIPT_DIR}/models/SadTalker/gfpgan/weights

cd ${SCRIPT_DIR}/models/SadTalker/checkpoints
for model in ${SADTALKER_MODELS[@]}; do
  wget -nv -nc $model   
done
unzip -n hub.zip
unzip -n BFM_Fitting.zip

cd ${SCRIPT_DIR}/models/SadTalker/gfpgan/weights
for model in ${GFPGAN_MODELS[@]}; do
  wget -nv -nc $model   
done

cd $SCRIPT_DIR
echo ""

# CONTROLNET
CONTROLNET_MODELS=(
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_mlsd.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_normalbae.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_scribble.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_seg.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth"
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime.pth"
)

echo "Downloading ControlNet models..."
cd ${SCRIPT_DIR}/extensions/sd-webui-controlnet/models
for model in ${CONTROLNET_MODELS[@]}; do
  wget -nv -nc $model
done

cd $SCRIPT_DIR
echo ""

PIXEL_MODELS=(
    "https://drive.google.com/uc?id=1VRYKQOsNlE1w1LXje3yTRU5THN2MGdMM&export=download"
    "https://drive.google.com/uc?id=17f2rKnZOpnO9ATwRXgqLz5u5AZsyDvq_&export=download"
    "https://drive.google.com/uc?id=1i_8xL3stbLWNF4kdQJ50ZhnRFhSDh3Az&export=download"
)

cd ${SCRIPT_DIR}/extensions/stable-diffusion-webui-pixelization/checkpoints
for model in ${PIXEL_MODELS[@]}; do
  gdown $model   
done

cd $SCRIPT_DIR
echo ""