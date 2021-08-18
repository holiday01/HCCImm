trans <- function(arg,sample,ref){
  platform <- arg$platform
  normalized <- arg$normalized
  name <- colnames(sample)
  if(platform == "micararray"){
    if(normalized == "raw"){
      o <- preprocessCore::normalize.quantiles.use.target(as.matrix(sample[,-1]),target = as.numeric(unlist(ref[,-1])))
      sample <- data.frame(as.character(sample[,1]), as.numeric(o))
    }
  }
  
  if(platform == "rnaseq"){
    o <- log2(sample[,-1]+1)+7
    sample <- data.frame(as.character(sample[,-1]), as.numeric(o))
  }
  colnames(sample) <- name
  return(sample)
}