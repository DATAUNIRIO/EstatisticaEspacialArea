library(maptools)

##carregando o mapa - o comando abaixo abrir? uma caixa de dialogo. Voce dever? clicar no arquivo Brasil.shp
banco <-readShapeSpatial(file.choose())
plot(banco) # plota o mapa do Brasil


