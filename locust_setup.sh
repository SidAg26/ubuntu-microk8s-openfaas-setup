# Pre-requisite: conda installation
# create conda env
conda create -n requests python==3.12.3 # mention the python version of your choice
# activate environment 
conda activate requests

# install locust 
pip install locust
# check installation
locust -V
