library(rgdal)
library(RColorBrewer)

##carregando o mapa - o comando abaixo abrir uma caixa de dialogo. 
##Voce dever clicar no arquivo Brasil.shp

banco <-readOGR(file.choose())
#maptools banco <-readShapeSpatial(file.choose())
#sf       banco <-st_read(file.choose())
plot(banco) # plota o mapa do Brasil


##carregando a base de dados (arquivo parto_2014.csv)
dados <- read.csv('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/parto_2014.csv',sep=";",dec=",")

#Escolhendo a cor
COR<-brewer.pal(4,'YlOrRd')
#COR<-brewer.pal(4,'Blues')
COR

# Utilizando a funcao MAPA no github
source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/dados_de_area.R')


library(tmap)
library(XML)
library(cartogram)

# Utilizando o pacote cartograma no github
source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/cartograma.R')

mapatradicional
anamorfismo


