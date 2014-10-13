raspberry-radiator
==================

A repo containing configuration for raspberry pi powered info radiator computers.

The idea is that you can run the provision.sh on the radiator pi to update its configuration. The script must be kept idempotent so that it can be run many times.

Install
=======

This runs the provisioning script and clones the repo to the raspberry pi:

sudo apt-get install wget

wget -O - https://raw.githubusercontent.com/pijokela/raspberry-radiator/master/provision.sh | sudo bash