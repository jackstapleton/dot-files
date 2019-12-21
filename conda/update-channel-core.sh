#!/bin/bash

# create core channel if it does not exist
if [ ! -d "$CORECHANNEL/linux-64" ]; then
    bash $BUILDDIRECTORY/build-scripts/create-channel-core.sh
    exit 0
fi

# activate conda
# conda activate base

# build repos
# conda build $REPOS/kdb-core/info/recipe
# conda build $REPOS/kdb-eventbus/info/recipe
# conda build $REPOS/kdb-rdb/info/recipe

# copy to core channel
cp $CONDA_HOME/conda-bld/linux-64/kdb-core* $CORECHANNEL/linux-64/
cp $CONDA_HOME/conda-bld/linux-64/kdb-eventbus* $CORECHANNEL/linux-64/
cp $CONDA_HOME/conda-bld/linux-64/kdb-rdb* $CORECHANNEL/linux-64/

# index core channel
# conda index $CORECHANNEL
