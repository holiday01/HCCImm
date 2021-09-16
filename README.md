# HCCImm is a new tools ot estimate the fractions of immune cells using HCC gene expression


## Require
  R and python. You can download package from setup.sh

## Content
The data provided in ./Data/REFs.csv is used as the reference gene expression signatures (RefGES) for 17 cell types treated in this method.

Users can get the estimated proportions of the 17 immune cells running main.sh. The requirement of the script is above,
* -i, input data (CSV file or TXT file)
* -p, platform (rnaseq or microarray)
* -n, if data is raw count (raw for microarray or tpm for rnaseq)
* -o, the director that is the output for preprocessing as well as the input for HCCImm
* -s, the proportions of 17 cells.


## Synopsis

  bash main.sh -i ./Data/example_expression_profile.csv -p microarray -n raw -o ./ -s ./
  
# Contribution

   Yen-Jung Chiu (holiday01) and Yen-Hua Huang created this method. holiday01 implemented the code. 

# Reference
