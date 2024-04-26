#!/bin/bash

mkdir simulated_data
cd simulated_data

for i in `seq 1 4`;
do
  mkdir out_${i};
  cd out_${i};
  wget https://zenodo.org/records/1291375/files/out_${i}.tar?download=1;
  cd ..;
done

for i in `seq 5 8`;
do
  mkdir out_${i};
  cd out_${i};
  wget https://zenodo.org/records/1291404/files/out_${i}.tar?download=1;
  cd ..;
done

for i in `seq 9 12`;
do
  mkdir out_${i};
  cd out_${i};
  wget https://zenodo.org/records/1291443/files/out_${i}.tar?download=1;
  cd ..;
done

cd ..
