#!/bin/bash

tensorboard --logdir /data/jupyter/tensorboard/&
nvidia-smi -l
