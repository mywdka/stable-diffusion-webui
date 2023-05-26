#!/bin/bash
mkdir -p models/SadTalker
cd models/SadTalker
bash <(wget -qO- https://raw.githubusercontent.com/Winfredy/SadTalker/main/scripts/download_models.sh)
