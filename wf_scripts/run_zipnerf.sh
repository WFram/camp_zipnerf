export CUDA_VISIBLE_DEVICES=0

DATA_DIR=$1
CHECKPOINT_DIR=~/tmp/zipnerf/custom/shoes

python -m camp_zipnerf.train \
    --gin_configs=configs/zipnerf/custom.gin \
    --gin_bindings="Config.data_dir = '${DATA_DIR}'" \
    --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}'"
