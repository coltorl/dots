#!/bin/sh
#
#remove unneeded packages
pacman -Qdtq | sudo pacman -Rns -

nmcli --ask connection up OMSCS 
