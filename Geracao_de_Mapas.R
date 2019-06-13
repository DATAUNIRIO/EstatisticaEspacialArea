library(rgdal)

##carregando o mapa - o comando abaixo abrir uma caixa de dialogo. 
##Voce dever clicar no arquivo Brasil.shp

banco <-rgdal::readOGR(file.choose())
#maptools banco <-readShapeSpatial(file.choose())
#sf       banco <-st_read(file.choose())
plot(banco) # plota o mapa do Brasil

source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/dados_de_area.R')

source('https://raw.githubusercontent.com/DATAUNIRIO/Estatistica_Espacial/master/github/cartograma.R')

tm_shape(base) + tm_fill("Vaginal", style="jenks") +
  tm_borders() + tm_layout(frame=F)
