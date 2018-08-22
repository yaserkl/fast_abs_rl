#!/usr/bin/env bash
root_dir=$1
dirs=($root_dir/*/)

for dir in "${dirs[@]}"
do
    export DATA=$dir/merged_qa/
    python decode_full_model.py --path=$dir/output-merged_qa/ --model_dir=$HOME/working_dir/absrl/pretrained/new/ --beam=5 --test
    export DATA=$dir/qa/
    python decode_full_model.py --path=$dir/output-qa/ --model_dir=$HOME/working_dir/absrl/pretrained/new/ --beam=5 --test
done
