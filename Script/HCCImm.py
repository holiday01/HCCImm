#!/usr/bin/python
import pandas as pd
import numpy as np
from sklearn.svm import LinearSVR
import sys

if len(sys.argv) != 3:
    print("The parameters are error, e.g. python HCCImm.py inputdir outputdir")
print("inputdir: ",sys.argv[1])
print("outputdir: ",sys.argv[2])

test_data = pd.read_csv(sys.argv[1]+"/sample.csv")
test_data = test_data.drop("Genes",1)
reference = pd.read_csv(sys.argv[1]+"/sample_ref.csv")
filename = test_data.columns
reference = reference.drop("Genes",1)
sn = len(reference.columns)
score_adj = []
for o in range(len(test_data.columns)):
    test = test_data.loc[:,test_data.columns[o]]
    train = reference
    im_name = train.columns
    svr = LinearSVR(random_state=0, max_iter=1000000)
    model = svr.fit(train, test)
    score = model.coef_
    score[np.where(score<0)] = 0 
    score_adj.append((score/sum(score)))
score_adj = pd.DataFrame(score_adj)
score_adj.columns = im_name
score_adj.index = filename
score_adj.to_csv(sys.argv[2]+"/score.csv")
print("Done")
