#!/usr/bin/env bash

# get all of the daily data from all weather stations and generate list of stations
code/get_ghcnd_data.bash ghcnd_all.tar.gz
code/get_ghcnd_all_files.bash

# get listing of types of data found at each weather station
code/get_ghcnd_data.bash ghcnd-stations.txt

# get metadata for each weather station
code/get_ghcnd_data.bash ghcnd-inventory.txt

# test to see if everything will run 
snakemake --np

# run everything in the snakemake file
snakemake -c 1

# visualize how the files relate to each other 
snakemake --dag target | dot -Tpng > dag.png