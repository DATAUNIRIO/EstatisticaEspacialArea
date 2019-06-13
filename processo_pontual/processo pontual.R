##install.packages(c("splancs","spatstat")

require(splancs)
require(spatstat)

### Gerando o processo
plot(square(1))
regiao<-getpoly()
	polymap(regiao)
	dados<-addpoints(plot=T)
	pointmap(dados,add=T)

### Gerando um processo totalmente aleatorio
X11()
	poisson<-csr(regiao,50)
		polymap(regiao)
		pointmap(poisson,add=T)


###################
### Metodo Quadrats
 X <- runifpoint(50)
 quadratcount(X)
 quadratcount(X, 4, 5)
 quadratcount(X, xbreaks=c(0, 0.3, 1), ybreaks=c(0, 0.4, 0.8, 1))
 qX <-  quadratcount(X, 4, 5)

	plot(X, pch="+")
 	plot(qX, add=TRUE, col="red", cex=1.5, lty=2)

quadrat.test(qX)
quadrat.test(qX,method="MonteCarlo")


d <- as.ppp(poisson,c(0,1,0,1))
  	qdados<-quadratcount(d,,5,5)
    	plot(regiao,type="l",main="Locais de moradia")
	pointmap(as.points(d),add=TRUE)
 	plot(qdados,regiao,add=TRUE,col=2,cex=1.3)

quadrat.test(qdados)

### quadrats via tessellation:
	b <- dirichlet(runifpoint(20))
	qx <- quadratcount(d, tess=b)
  	plot(regiao,type="l",main="Locais de moradia")
	plot(d, pch="+",add=T)
	plot(qx, add=TRUE, col="blue", cex=1.5, lty=2)

quadrat.test(qx)



#### Intensidade( efeito de primeira ordem)

## Cardiff
data(cardiff)
	plot(cardiff$poly,type="l",main="Locais de moradia")
	pointmap(as.points(cardiff),add=TRUE)

dados <- as.ppp(cardiff)
	qdados<-quadratcount(dados,5,5)
	plot(cardiff$poly,type="l",main="Locais de moradia")
	pointmap(as.points(cardiff),add=TRUE)
  	plot(qdados,add=TRUE,col=2,cex=1.3)

quadrat.test(qdados)  

par(mfrow=c(1,3))
plot(cardiff$poly,type="l",main="Locais de moradia")
pointmap(as.points(cardiff),add=TRUE)

intensidade.5<-kernel2d(as.points(cardiff),cardiff$poly,5,nx=100,ny=100,kernel="quartic")
image(intensidade.5,col=terrain.colors(256),main=expression(tau==5))
pointmap(as.points(cardiff),add=TRUE,cex=0.5)

intensidade.10<-kernel2d(as.points(cardiff),cardiff$poly,10,nx=100,ny=100,kernel="quartic")
image(intensidade.10,col=terrain.colors(256),main=expression(tau==10))
pointmap(as.points(cardiff),add=TRUE,cex=0.5)


intensidade.20<-kernel2d(as.points(cardiff),cardiff$poly,20,nx=100,ny=100,kernel="quartic")
image(intensidade.20,col=terrain.colors(256),main=expression(tau==20))
pointmap(as.points(cardiff),add=TRUE,cex=0.5)



### Teste do visinho mais proximo (efeitos de segunda ordem)

data(cardiff)
w<-seq(0,50,0.5)
ghat<-Ghat(as.points(cardiff), w)
plot(w, ghat,type="l", xlab="distancia", ylab="F.d. empirica de G")

S.Ghat <- Ghat(csr(cardiff$poly, length(cardiff$x)), seq(0,50,0.5))
points(S.Ghat,col=2,t="l")

 
### Funcaoo K
h <- seq(0,100,1)
funcaoK<-khat(as.points(cardiff), cardiff$poly, h)
plot(h, funcaoK,type="l", xlab="dist?ncia", ylab="F.d. emp?rica de K")



