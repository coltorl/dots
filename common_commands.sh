#!/bin/sh
#
#remove unneeded packages
pacman -Qdtq | sudo pacman -Rns -
