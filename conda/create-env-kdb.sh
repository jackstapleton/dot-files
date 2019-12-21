#!/bin/bash

conda activate base

# create env
conda env create --file=$BUILDDIRECTORY/aws-installs/environment-kdb.yml
