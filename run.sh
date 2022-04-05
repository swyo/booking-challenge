#!/bin/bash
# Requirement: python 3.7

# Download
# ========
# download dataset
bash download.sh
# download requirement programs
pip install -r requirements.txt
wget https://github.com/Synerise/cleora/releases/download/v1.1.0/cleora-v1.1.0-x86_64-unknown-linux-gnu -O cleora-v1.1.0-x86_64-unknown-linux-gnu
chmod 777 cleora-v1.1.0-x86_64-unknown-linux-gnu

# Preprocessing
# =============
# train-test split
python src/train_valid_split.py --train download/train_set.csv
# create encoding
python src/encoding.py --train data/train.csv --test data/valid.csv
# data preprocessing
python src/data_preprocessing.py --train data/train.csv --test data/valid.csv --ground-truth data/ground_truth.csv

# Train
python src/train.py
