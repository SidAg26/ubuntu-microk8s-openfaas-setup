# List the cache
pip cache list

# Remove the cache
pip cache purge | -y

# Clean the conda packages
conda clean --all | -y

# Clean package cache
sudo apt-get autoremove
sudo apt-get clean

# Remove old kernels
sudo apt-get remove --purge $(dpkg -l | awk '/^ii  linux-image-[0-9]/{print $2}' | grep -v $(uname -r))

# Clean up log files
sudo journalctl --vacuum-time=2weeks
sudo rm -rf /var/log/*.log

# Remove temporary files
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# Remove Docker images and containers
docker container prune -f
docker image prune -a -f
docker volume prune -f

# Remove unused Snap packages
sudo snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do sudo snap remove "$snapname" --revision="$revision"; done

# Find and remove large files
# sudo find / -type f -size +100M -exec rm -i {} \;
