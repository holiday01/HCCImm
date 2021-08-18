unigene <- function(sample,ref){
  g_l <- which(ref[,1]%in%sample[,1])
  sample <- sample[which(sample[,1]%in%ref[,1]),]
  sample_out <- matrix(0,length(g_l),dim(sample)[2])
  for(n in 2:dim(sample)[2]){
    out <- rep(0,length(g_l))
    i <- 0
    for(g in ref[g_l,1]){
      l <- which(sample[,1] == g)
      i <- i+1
      out[i] <- max(sample[l,n])
    }
    sample_out[,n-1] <- out
  }
  ref_out <- ref[g_l,]
  sample_out <- data.frame(as.character(ref_out[,1]),sample_out)
  colnames(sample_out) <- colnames(sample)
  return(list(ref_out,sample_out))
}
