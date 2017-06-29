#! /bin/sh
echo "$(date +'%m/%d/%Y %H:%M:%S') Started"

cntk configFile=ResNet50_ImageNet1K.cntk \
	DataDir=./data \
	OutputDir=Output/run-single.$$ \
	TrainNetwork=[SGD=[maxEpochs=100]] \
	TrainNetwork=[SGD=[minibatchSize=32]] \
	stderr=- timestamping=true <&- 2>&1
