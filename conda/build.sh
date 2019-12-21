#!/bin/bash

bash $BUILDDIRECTORY/build-scripts/update-channel-all.sh

cp -r $BUILDDIRECTORY/aws-installs $S3JUMPPOINT/
cp -r $BUILDDIRECTORY/repos $S3JUMPPOINT/
