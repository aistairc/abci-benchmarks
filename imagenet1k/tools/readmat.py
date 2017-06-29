import scipy.io
import sys

mat = scipy.io.loadmat('data/ILSVRC2012_devkit_t12/data/meta.mat')
synsets = mat['synsets']

dic = {}

for i in range(0, 1000):
    synset = synsets[i]
    ilsvrc2012_id = synset[0][0][0][0]
    wnid = synset[0][1][0]
    if ilsvrc2012_id == 1000:
        ilsvrc2012_id = 0
    dic[wnid] = ilsvrc2012_id

for line in sys.stdin:
    ls = line.split('/')
    print('.../%s\t%s' % (line.strip('\n'), dic[ls[1]]))
