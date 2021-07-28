require(multicore)
discrepo<-function(x){
	(x[1]-x[2])^2
}
#funcion para vectorizar la funcion de comparacion f
vediscre <- function(x,y)
{
	d<-NULL
	for(i in 1:length(x)){
		d<-c(d,discrepo(c(x[i],y[i])))
	}
	d<-sqrt(sum(d))
	return(d)
}
#funcion para la paralelizacion de:::: out <- mclapply(pair, distRober)
distRober<-function(x,y=calador){
	vediscre(y[x[1],],y[x[2],])
}

#funcion para calcular la distancia que hay entre todos los miembros de un componente en una matriz usando la comparacion f
distanciaRober <- function(x)
{
	tamaj<-dim(x)[1]
	d<-matrix(0,nrow=tamaj,ncol=tamaj)
	rownames(d)<-dimnames(x)[[1]]
	colnames(d)<-dimnames(x)[[1]]
	pair<-combn(1:nrow(x),2,simplify=FALSE)
	out <- mclapply(pair, distRober, y=x)
	for(i in 1:length(out)){
		d[unlist(pair[i])[1],unlist(pair[i])[2]]<-unlist(out[i])
		d[unlist(pair[i])[2],unlist(pair[i])[1]]<-unlist(out[i])
	}
	return(as.dist(d))
}





nucleo<-read.table(commandArgs(trailingOnly=T)[1],header=TRUE)
mininucleo<-nucleo[3:5]
#rownames(mininucleo)<-nucleo[2]
#distan<-dist(mininucleo,upper=TRUE,diag=TRUE)
distan<-distanciaRober(mininucleo)
write.table(as.matrix(distan),file="distancias.txt",sep=",",quote=FALSE)
