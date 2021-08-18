unigene <- function(sample,ref){
  ref_out <- {}
  sample_out <- {}
  out <- {}
  g_l <- which(sample[,1]%in%ref[,1])
  for(n in 2:dim(sample)[2]){
    for(g in ref[,1]){
      l <- which(sample[,1] == g)
      if(length(l) >= 1){
        out <- c(out,max(sample[l,n]))
        ref_out <- rbind(ref_out,ref[which(ref[,1]==g),])
      }else{}
    }
    sample_out <- cbind(sample_out,out)
  }
  sample_out <- cbind(as.character(ref_out[,1]),sample_out)
  return(list(ref_out,sample_out))
}