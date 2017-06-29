#! /bin/sh -e

tmpfile=$(mktemp label.XXXXXX) || exit 1

sed 's/1000/0/' > $tmpfile < \
	data/ILSVRC2012_devkit_t12/data/ILSVRC2012_validation_ground_truth.txt
(cd data && find val -type f) | sort | sed 's/^/...\//' |
	paste - $tmpfile > data/val_map.txt

(cd data && find train -name '*.JPEG') | sort |
	python tools/readmat.py > data/train_map.txt

rm $tmpfile
