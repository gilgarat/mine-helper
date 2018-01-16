# Add universe repo to make sure dependcies will be available for download.
add-apt-repository universe
apt-get --yes --force-yes update

# Remove large packages to make space on Ububtu Live Pendrive
apt-get --yes --force-yes remove libreoffice-*

#Install build depencies
apt-get --yes --force-yes install git libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev

# Configure large page support 
sysctl -w vm.nr_hugepages=128

chmod 755 ./xmr-stak-cpu

# Start miner
cd bin
./xmr-stak-cpu config3.txt