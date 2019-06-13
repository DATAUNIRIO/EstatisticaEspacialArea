#pacotes necessario
library(spdep)
library(stringr)
library(maptools)



##carregando o mapa - o comando abaixo abrir? uma caixa de dialogo. Voce dever? clicar no arquivo Brasil.shp
#banco <-readShapeSpatial(file.choose())
#plot(banco) # plota o mapa do Brasil

##carregando a base de dados - o comando abaixo abrir? uma caixa de di?logo. Voc? dever? clicar no arquivo parto_2014.csv
dados <- read.csv('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/parto_2014.csv',sep=";",dec=",")

## Relaciona os estados do "banco" com as informa??es dos "dados"
base <- merge(banco,dados,by.x="UF",by.y="UF")
dim(base)


mapa <- function(valor, titulo){
  brks <- round(quantile(valor,probs=seq(0,1,0.25)),3)
  cols <- COR
  plot(base, col=cols[findInterval(valor, brks)])
  legend("bottomleft",legend=leglabs(brks, "<", ">="),fill=cols, bty="n", cex=0.8)
  title(main=titulo)
}


##Parto Vaginal
par(mfrow=c(1,2))
mapa(base@data$Vaginal,"Parto Vaginal")
mapa(base@data$p_v,"Proporcao Parto Vaginal")

##Parto Cesario
mapa(base@data$Cesario,"Parto Cesario")

##Parto Ignorado
mapa(base@data$Ignorado,"Parto Ignorado")



