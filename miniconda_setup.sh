sudo apt update
sudo apt upgrade -y
# install miniconda
mkdir miniconda
cd miniconda/
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda.sh
bash ~/miniconda/miniconda.sh -b -u -p ./miniconda
rm -rf ~/miniconda/miniconda.sh
./miniconda/bin/conda init bash
./miniconda/bin/conda init zsh
exit