#!/bin/bash
sudo docker swarm init --advertise-addr enp0s8
sudo docker swarm join-token manager | grep docker > /vagrant/masters.sh
sudo docker swarm join-token worker | grep docker > /vagrant/workers.sh
