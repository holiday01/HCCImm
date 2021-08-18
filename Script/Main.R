require(getopt)
require(preprocessCore)

arg = getopt(matrix(c(
  'input.file.name', 'i', 1, "character",
  'platform', 'p', 1, "character",
  'normalized', 'n', 1, "character",
  'output', 'o', 1, "character"
), byrow=TRUE, ncol=4))

ref <- read.csv("./Data/REFs.csv")
sample <- read.delim("Data/20200409_LIHC_gene_tpm.txt",sep = "\t")
input <- arg$input.file.name
platform <- arg$platform
normalized <- arg$normalized
out <- arg$output

if(length(grep("csv",input))==1){
  sample <- read.csv(input)
}else if (length(grep("txt",input))==1){
  sample <- read.delim(input,sep = "\t")
}


source("./Script/check.R")
check(arg)

source("./Script/Transform.R")
sample <- trans(arg,sample,ref)
print("Check transform finished")


source("./Script/unique_gene.R")
r <- unigene(sample,ref)
ref_out <- as.data.frame(r[[1]])
sample_out <-  as.data.frame(r[[2]])
colnames(ref_out) <- colnames(ref)
colnames(sample_out) <- c("Genes",colnames(sample)[-1])
rm(r,sample,ref)


write.csv(ref_out,paste0(out,"/sample_ref.csv"),row.names = F)
write.csv(sample_out,paste0(out,"/sample.csv"),row.names = F)


print("Preprocessing finished")
