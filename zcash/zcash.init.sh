#------------------------
# zCash Miner Init v0.2 -
#------------------------
#
# by Gilgarat, Nov 3, 2017
#
# Script to download, build and run NiceHash miner to mine zCash on suprnova mining pool.
# Adjust the mining pool settings in the last line to mine for your own wallet or with 
# a different mining pool.
# Please, review the script and run it with: sudo
#
# Designed to be able to run from an Ububtu Live Pendirve without anyting installed on
# the computer. If you restart Ubuntu Live you need to run the whole scrip again.
# If you only want to restart the miner running the last line from CLI is enough.
#
#  Changelog
#	v0.2: added force yes for apt calls

# Add universe repo to make sure dependcies will be available for download.
add-apt-repository universe
apt-get --yes --force-yes update

# Remove large packages to make space on Ububtu Live Pendrive
apt-get --yes --force-yes remove libreoffice-*

#Install build depencies
apt-get --yes --force-yes install git cmake build-essential libboost-all-dev

# Get the code, assemble, build, link.
git clone -b Linux https://github.com/nicehash/nheqminer.git
cd nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)

# Start mining zcash on suprnova mining pool
./nheqminer_cpu -l zec-eu.suprnova.cc:2142 -u Gilgarat.oldlap -p oldlap -t $(nproc)

