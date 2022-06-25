#!/bin/bash

echo -e "Setting up GAW configuration\n"

# Create GAW configuration directory
if [[ ! -d "${HOME}/.gaw" ]]
then
	echo "Creating GAW configuration directory..."
	mkdir -p ${HOME}/.gaw
else
	echo "GAW configuration directory already existed!"
fi

# Create GAW configuration file
if [[ ! -f "${HOME}/.gaw/gawrc" ]]
then
	echo "Creating GAW configuration file..."
	cp ./config_files/gawrc ${HOME}/.gaw/
else
	echo "GAW configuration file already existed!"
	echo "Backing up the current GAW configuration file"
	suffix=`date +"%Y%m%d"`
	mv ${HOME}/.gaw/gawrc ${HOME}/.gaw/gawrc${suffix}
	echo "Copying the new GAW configuration file"
	cp ./config_files/gawrc ${HOME}/.gaw/
fi

echo -e "\nSetting up XSCHEM configuration\n"

# Create XSCHEM configuration directory
if [[ ! -d "${HOME}/.xschem" ]]
then
	echo "Creating XSCHEM configuration directory..."
	mkdir -p ${HOME}/.xschem
else
	echo "XSCHEM configuration directory already existed!"
fi

# Create XSCHEM configuration file
if [[ ! -f "${HOME}/.xschem/simrc" ]]
then
	echo "Creating XSCHEM configuration file..."
	cp ./config_files/simrc ${HOME}/.xschem/
else
	echo "XSCHEM configuration file already existed!"
	echo "Backing up the current XSCHEM configuration file"
	suffix=`date +"%Y%m%d"`
	mv ${HOME}/.xschem/simrc ${HOME}/.xschem/simrc${suffix}
	echo "Copying the new XSCHEM configuration file"
	cp ./config_files/simrc ${HOME}/.xschem/
fi

echo -e "\nSetting Up NGSPICE configuration\n"

# Create NGSPICE simulation directory
if [[ ! -d "${HOME}/.xschem/simulations" ]]
then
	echo "Creating NGSPICE simulation directory..."
	mkdir -p ${HOME}/.xschem/simulations
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

echo -e "\nSetting Up Directory for an Example of Analog IC design\n"
if [[ ! -d "${HOME}/ExampleAnalogIC" ]]
then
	echo "Creating the Example directory..."
	mkdir -p ${HOME}/ExampleAnalogIC
	echo "Copying Example schematics..."
	cp ./example_sch/*.sch ${HOME}/ExampleAnalogIC
	echo 'Creating a script to launch xschem'
    echo '#!/bin/bash' > ${HOME}/ExampleAnalogIC/run_xschem
    echo 'xschem $1 --rcfile xschemrc' > ${HOME}/ExampleAnalogIC/run_xschem
    chmod 755 ${HOME}/ExampleAnalogIC/run_xschem
    cp /usr/local/share/pdk/sky130A/libs.tech/xschem/xschemrc ${HOME}/ExampleAnalogIC/
else
	echo "Example directory is already existed!"
	echo "Backing up the existing Example directory"
	suffix=`date +"%Y%m%d"`
	mv ${HOME}/ExampleAnalogIC ${HOME}/ExampleAnalogIC${suffix}
	echo "Creating a new Example directory..."
	mkdir -p ${HOME}/ExampleAnalogIC
	echo "Copying Example schematics..."
	cp ./example_sch/*.sch ${HOME}/ExampleAnalogIC
	echo 'Creating a script to launch xschem'
    echo '#!/bin/bash' > ${HOME}/ExampleAnalogIC/run_xschem
    echo 'xschem $1 --rcfile xschemrc' > ${HOME}/ExampleAnalogIC/run_xschem
    chmod 755 ${HOME}/ExampleAnalogIC/run_xschem
    cp /usr/local/share/pdk/sky130A/libs.tech/xschem/xschemrc ${HOME}/ExampleAnalogIC/
fi






