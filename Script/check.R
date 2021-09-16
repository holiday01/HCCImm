check <- function(arg){
  input <- arg$input.file.name
  platform <- arg$platform
  normalized <- arg$normalized
  
  if(length(which(unique(sample[,1])%in%ref[,1]))<100){
    print("error: genes < 100")
    break
  }
 
  if(platform == "microarray" | platform == "rnaseq"){}else{
    print("error: please input correct information of platform (microarray or rnaseq)")
    break
  }
  
  if(normalized == "raw" | normalized == "rma" | normalized== "tpm"){}else{
    print("error: please input correct information for counts (raw or rma or tpm)")
    break
  }
 
  if(platform == "rnaseq"){
    if(normalized == "rma" | normalized == "rma" ){
      print("error: RNA-seq data just input TPM counts")
      break
    }
  }
  if(platform == "micararray"){
    if(normalized == "tpm" ){
      print("error: Microarray data should input RAW or RMA counts")
      break
    }
  }
  return(print("Check finished"))
}
