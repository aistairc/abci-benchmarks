#! /bin/sh
echo "$(date +'%m/%d/%Y %H:%M:%S') Started"
mpirun -np 32 --npernode 4 \
cntk configFile=ResNet50_ImageNet1K.cntk \
	DataDir=./data \
	OutputDir=Output/run-parallel.$$ \
	TrainNetwork=[SGD=[maxEpochs=100]] \
	TrainNetwork=[SGD=[minibatchSize=1024]] \
	stderr=- timestamping=true <&- 2>&1
