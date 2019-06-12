inputs<- list.files("~/Downloads/net-input/")
for (i in 1 :length(inputs))
{
  input<- as.matrix(read.table(paste("~/Downloads/net-input/",inputs[i],sep=""),header=T,sep=",",stringsAsFactors = F))
  input<- input[,-1]
  class(input)<- "integer"
  input.flat <- aggregate(input[,2],by=list(input[,1]),FUN=paste, collapse=",")
  write.csv(input.flat, file =paste("~/Downloads/FlatNet/FlatNet.",inputs[i],sep = ""))
}



#input<- as.matrix(read.table(("~/Downloads/net-input/InputNetwork.Intersection-19.csv"),header=T,sep=",",stringsAsFactors = F))



 
  
  
  