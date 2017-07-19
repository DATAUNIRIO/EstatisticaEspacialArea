#pacotes necessário
library(spdep)
library(stringr)
library(maptools)
library(rgdal)

##carregando o mapa - o comando abaixo abrirá uma caixa de diálogo. Você deverá clicar no arquivo Brasil.shp
banco <-readShapeSpatial(file.choose())
plot(banco) # plota o mapa do Brasil

##carregando a base de dados - o comando abaixo abrirá uma caixa de diálogo. Você deverá clicar no arquivo parto_2014.csv
dados <- read.csv(file.choose(),sep=";",dec=",")
\
######### 
#### sprintf("%03i",ind[,2]) ## coloca a variável código igual ao banco (com tres números)
#########

## Relaciona os estados do "banco" com as informações dos "dados"
base <- merge(banco,dados,by.x="UF",by.y="UF")
dim(base)


mapa <- function(valor, titulo){
  brks <- round(quantile(valor,probs=seq(0,1,0.25)),3)
  cols <- c("blue","skyblue","royalblue","gray20","gray20")
  plot(base, col=cols[findInterval(valor, brks)])
  legend("bottomleft",legend=leglabs(brks, "<", ">="),fill=cols, bty="n", cex=0.8)
  title(main=titulo)
}


##Parto Vaginal
mapa(base@data$p_v,"Parto Vaginal")

##Parto Cesário
mapa(base@data$Cesário,"Parto Cesário")

##Parto Ignorado
mapa(base@data$Ignorado,"Parto Ignorado")


### ANÁLISE ESPACIAL

# parte importante matriz de vizinhaca
	viz <- poly2nb(base)
	coord.bairro<-coordinates(base)
	mat <- nb2mat(viz,style="B", zero.policy=TRUE)
mat.bin <- mat2listw(mat)


plot(base)
plot(viz,coord.bairro,add=T,col="red")
title(main="Estrutura de vizinhaça")

##############################
### manipulando a matriz de vizinhança
#mat <- nb2mat(viz,style="B", zero.policy=TRUE)
##mat2 <- fix(mat2)
##write.csv2(mat2,"matriz_espaço.csv")
#mat2 <- read.csv2("matriz_espaço.csv",row.names="X")
#mat.bin <- mat2listw(as.matrix(mat2))
##########################################


#Índice de Moran Global
moran.test(base$Vaginal,mat.bin,zero.policy=T,alternative="two.sided")
moran.plot(as.vector(scale(base$Vaginal)),mat.bin,zero.policy=T) #padronizado
#moran.plot(base$Vaginal,mat.bin,zero.policy=T)

moran_mc <- moran.mc(base$Vaginal,mat.bin,zero.policy=T,999)

plot(moran_mc)
loc <- localmoran(base$Vaginal,mat.bin)

mapa(loc,"Moran local")


#SAR 
sar<-spautolm(Vaginal~Cesário+Ignorado, data=base,family="SAR", listw=mat.bin) 
summary(sar) 
#CAR 
sar<-spautolm(Vaginal~Cesário+Ignorado, data=base,family="CAR", listw=mat.bin) 
summary(sar) 

??spatialGLM
#####

vec <- c(0.67,0.11,1.23,-1.01,-1.01)

(vec)%*%t(vec)

w <- matrix(c(0,1/3,1/3,0,0,
		  1/2,0,1/3,1/3,0,
		  1/2,1/3,0,1/3,0,
		  0, 1/3,1/3,0,1,
		  0,0,0,1/3,0),ncol=5,nrow=5)

m <- w*(vec%*%t(vec))

I <- sum(m)/sum(vec^2)







