# Estatistica Espacial para dados de areas e de pontos  
## Código para geração de mapas do prof. Alexandre Silva do UNIRIO  
######install.packages(c("splancs","spatstat")  
require(splancs)  
require(spatstat)  
source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/processo_pontual.R')  

library(rgdal)  
library(maptools)  
library(RColorBrewer)  

######carregando o mapa - o comando abaixo abrir uma caixa de dialogo.   
######Voce dever clicar no arquivo Brasil.shp  

banco <-readOGR(file.choose())  
plot(banco) # plota o mapa do Brasil  


######carregando a base de dados (arquivo parto_2014.csv)  
dados <- read.csv('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/parto_2014.csv',sep=";",dec=",")  

######Escolhendo a cor  
COR<-brewer.pal(4,'YlOrRd')  
COR2<-brewer.pal(4,'Blues')  
COR3<-brewer.pal(4,'Reds')  
COR4<-brewer.pal(4,'Purples')  
COR  

###### Utilizando a funcao MAPA no github  
source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/dados_de_area.R')  

######Parto Vaginal  
par(mfrow=c(1,2))  
mapa(base$Vaginal,"Parto Vaginal",COR)  
mapa(base$p_v,"Proporcao Parto Vaginal",COR2)  

######Parto Cesario  
mapa(base$Cesario,"Parto Cesario",COR3)  

######Parto Ignorado   
mapa(base$Ignorado,"Parto Ignorado",COR4)  

######install.packages(c("tmap","cartogram"))  
library(tmap)  
library(cartogram)  

###### Utilizando o pacote cartograma no github  
source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/cartograma.R')  

mapatradicional  
anamorfismo  