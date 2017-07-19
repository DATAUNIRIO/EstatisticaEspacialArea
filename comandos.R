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

## Relaciona os estados do "banco" com as informações dos "dados"
base <- merge(banco,dados,by.x="UF",by.y="UF")
dim(base)


mapa <- function(valor, titulo){
  brks <- round(quantile(valor,probs=seq(0,1,0.25)),3)
  cols <- c("gray90","gray70","gray50","gray20","gray20")
  plot(base, col=cols[findInterval(valor, brks)])
  legend("bottomleft",legend=leglabs(brks, "<", ">="),fill=cols, bty="n", cex=0.8)
  title(main=titulo)
}


##Parto Vaginal
par(mfrow=c(1,2))
mapa(base@data$Vaginal,"Parto Vaginal")
mapa(base@data$p_v,"Proporção Parto Vaginal")

##Parto Cesário
mapa(base@data$Cesário,"Parto Vaginal")

##Parto Ignorado
mapa(base@data$Ignorado,"Parto Ignorado")



library(tmap)
library(XML)
library(cartogram)


### Deformando os mapas


tm_shape(base) + tm_fill("Vaginal", style="jenks") +
  tm_borders() + tm_layout(frame=F)

uf_vaginal <- cartogram(base, "Vaginal", itermax=4)

tm_shape(uf_vaginal) + tm_fill("Vaginal", style="jenks") + tm_borders() + tm_layout(frame=F)
