
nucleo<-read.table(commandArgs(TRUE)[1],header=TRUE)

longitud<-length(nucleo[[2]])
max<-longitud*(longitud-1)*0.5
uno<-1
dos<-2
longAct<-longitud
for(i in 1:max){
	dix<-as.double(dist(rbind(nucleo[uno,3:5],nucleo[dos,3:5])))
	if(dix<=10){
		cat(dix,uno,dos,"\n",sep=" ")
	}
	if(longAct==dos){
		uno<-uno+1
		dos<-uno+1
		longAct<-longAct-1
	}
	else{
		dos<-dos+1
	}
}
