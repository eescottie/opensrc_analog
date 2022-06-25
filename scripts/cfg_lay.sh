#!/bin/bash

# Have to update

if [[ ! -d "./layout" ]]
then
    echo "Creating layout directory..."
    mkdir ./layout
else
    echo "Layout directory already existed!"
fi

cd layout

if [[ ! -f "run_magic" ]]
then
    echo 'Creating script to launch layout editor magic'
    echo 'magic -rcfile sky130A.magicrc' > run_magic
    chmod 755 run_magic
    cp /usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc ./
else
    echo 'Script to launch layout editor magic already existed!'
fi

cd ..
