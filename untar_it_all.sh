#!/bin/bash

cd simulated_data

for i in `seq 1 12`;
do
  cd out_${i};
  tar  -xvf out_${i}.tar?download=1
  rm out_${i}.tar?download=1
  cd ..;
done
