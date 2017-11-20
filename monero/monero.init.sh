#-------------------------
# Monero Miner Init v0.2 -
#-------------------------
#
# by Gilgarat, Nov 18, 2017
#
# Script to download, build and run XMR Stap CPU miner to mine Monero on XML mining pools.
# Change config.txt in bin/ to set up the mining pool and your wallwet.
# Please, review the script and run it with: sudo
#
# https://github.com/fireice-uk/xmr-stak-cpu
#
# Designed to be able to run from an Ububtu Live Pendirve without anyting installed on
# the computer. If you restart Ubuntu Live you need to run the whole scrip again.
# If you only want to restart the miner running the last line from CLI is enough.
#
#  Changelog
#	v0.2: added replace config file 

# Add universe repo to make sure dependcies will be available for download.
add-apt-repository universe
apt-get --yes --force-yes update

# Remove large packages to make space on Ububtu Live Pendrive
apt-get --yes --force-yes remove libreoffice-*

#Install build depencies
apt-get --yes --force-yes install git libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev

# Get the code, assemble, build, link.
git clone https://github.com/fireice-uk/xmr-stak-cpu.git
cd xmr-stak-cpu/
cmake .
make install

# Configure large page support 
sysctl -w vm.nr_hugepages=128

# Replace the original config file with your configuration
yes | cp -rf ../config.txt bin/

# Start miner
cd bin
./xmr-stak-cpu