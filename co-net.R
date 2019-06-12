inputs<- list.files("input/")
len<- 2821361
scale<-as.numeric(len*(1/100))
res <- NULL
input<- as.matrix(read.table(paste("input/",inputs,sep=""),header=F,sep=",",stringsAsFactors = F))
nr=nrow(input)
for (i in 1: (nr-1)){
  print(i)
  for (j in (i+1):nr) {
    dist1 <- abs(as.numeric(input[i,2])-as.numeric(input[j,2]))
    dist2 <- abs(len + as.numeric(input[i,2])-as.numeric(input[j,2]))
    dist<- min(dist1,dist2)
    
    if(dist< scale) {
      pp <- c(input[i,4],input[i,2],input[i,6],input[i,7],input[j,4],input[j,2],input[j,6],input[j,7],dist1)
      res <- rbind(res,pp)
    }
    else break
  }
}
write.csv(res[,c(2,6,9)],paste("InputNetwork.",inputs,sep = ""))
write.csv(res,paste("netMutation.",inputs,sep = ""))
  