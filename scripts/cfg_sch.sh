#!/bin/bash

echo -e "Setting Up NGSPICE configuration\n"

# Create NGSPICE simulation directory
if [[ ! -d "${HOME}/.xschem/simulations" ]]
then
	echo "Creating NGSPICE simulation directory..."
	mkdir -p $HOME/.xschem/simulations
else
	echo "NGSPICE simulation directory already existed!"
fi

# Create NGSPICE configuration file
if [[ ! -f "${HOME}/.xschem/simulations/.spiceinit" ]]
then
	echo "Creating NGSPICE configuration file..."
	echo -en 'set ngbehavior=hsa\nset ng_nomodcheck\n' > ${HOME}/.xschem/simulations/.spiceinit
else
	echo "NGSPICE configuration file already existed!"
	echo "Backing up the current NGSPICE configuration file"
	suffix=`date +"%Y%m%d"`
	mv ${HOME}/.xschem/simulations/.spiceinit ${HOME}/.xschem/simulations/.spiceinit${suffix}
	echo "Creating the new NGSPICE configuraton file"
	echo -en 'set ngbehavior=hsa\nset ng_nomodcheck\n' > ${HOME}/.xschem/simulations/.spiceinit
fi

echo -e "\nCreating a Schematic Folder\n"

# Create a schematic folder
if [[ ! -d "./schematic" ]]
then
    echo "Creating schematic folder..."
    mkdir ./schematic
else
    echo "Schematic folder already existed!"
fi

# Generate a run_xschem script
if [[ ! -f "./schematic/run_xschem" ]]
then
    echo 'Creating a script to launch xschem'
    echo '#!/bin/bash' > ./schematic/run_xschem
    echo 'xschem $1 --rcfile xschemrc' > ./schematic/run_xschem
    chmod 755 ./schematic/run_xschem
    cp /usr/local/share/pdk/sky130A/libs.tech/xschem/xschemrc ./schematic/
else
    echo 'Script to launch xschem already existed!'
fi
