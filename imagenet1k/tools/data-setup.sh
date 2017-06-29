#! /bin/sh -e

if [ ! -f data/ILSVRC2012_devkit_t12.tar.gz ]; then
	echo missing data/ILSVRC2012_devkit_t12.tar.gz 1>&2; exit 1
fi

if [ ! -f data/ILSVRC2012_img_val.tar ]; then
	echo missing data/ILSVRC2012_img_val.tar 1>&2; exit 1
fi

if [ ! -f data/ILSVRC2012_img_train.tar ]; then
	echo missing data/ILSVRC2012_img_train.tar 1>&2; exit 1
fi

mkdir -p data/train data/val
tar xzfC data/ILSVRC2012_devkit_t12.tar.gz data
tar xfC data/ILSVRC2012_img_val.tar data/val
tar xfC data/ILSVRC2012_img_train.tar data/train
cd data/train && for f in *.tar; do
	mkdir ${f%.tar}; tar xfC $f ${f%.tar}; rm $f
done
