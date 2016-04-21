#!/usr/bin/env bash

cd /root
mkdir certificates
cd certificates
openssl req -x509 -nodes -days 365 -subj "/C=XX/ST=XX/L=XX/O=XX/CN=XX" -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
ipython profile create default
python -c "from IPython.lib import passwd; print passwd()" > /root/.ipython/profile_default/nbpasswd.txt
echo "# Configuration file for ipython-notebook.
c = get_config()
# Notebook config
c.NotebookApp.certfile = u'/root/certificates/mycert.pem'
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
# It is a good idea to put it on a known, fixed port
c.NotebookApp.port = 8888
PWDFILE='/root/.ipython/profile_default/nbpasswd.txt'
c.NotebookApp.password = open(PWDFILE).read().strip()" >> /root/.ipython/profile_default/ipython_notebook_config.py


echo -e "\n\n\n"
echo "-----------------------------------------------------------------"
echo "iPython notebook successfully set up!"
echo "-----------------------------------------------------------------"
echo -e "\n\n\n"
