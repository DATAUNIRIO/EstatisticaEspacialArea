library(rgdal)
banco <-readOGR(file.choose())
plot(banco) # plota o mapa do Brasil
View(banco)

library(readxl)
UF <- read_excel("C:/Users/Steven/Downloads/Base_de_dados-master/Base_de_dados-master/BasesEstados.xls")
View(UF)

## Relaciona os estados do "banco" com as informações dos "dados"
base <- merge(banco,UF,by.x="CD_GEOCODU",by.y="Codigo")

dim(base)
dim(banco)


library(tmap)
tm_shape(base) + tm_fill("IDH", style="jenks") +
  tm_borders() + tm_layout(frame=F)

tm_shape(base) + tm_fill("PIB", style="jenks") +
  tm_borders() + tm_layout(frame=F)


tmap_mode("view")
#tmap_mode("plot")

tm_shape(base) + tm_fill("PIB", style="jenks")

tm_shape(base) + tm_fill("PIB", style="jenks",palette = "seq")+
  tm_layout(aes.palette = list(seq = "RdYlGn"))


tmap_options(bg.color = "black", legend.text.color = "white")
tm_shape(base) + tm_fill("PIB", style="jenks")

tmap_mode("view")
tm_shape(base) + 
  tm_fill(c("PIB","IDH")) +
  tm_facets(sync = TRUE, ncol = 2)


#------------------------------------------------------------------------------


library(rgdal)
shape <-readOGR("C:/Users/Steven/Downloads/RJ-MUN/33MUE250GC_SIR.shp")
plot(shape) # plota o mapa do Brasil
View(shape)

library(readxl)
Mun_RJ <- read_excel("~/GitHub/Base_de_dados/BasesMunicipios.xlsx")
View(Mun_RJ)

## Relaciona os estados do "banco" com as informações dos "dados"
base_para_mapa <- merge(shape,Mun_RJ,by.x="CD_GEOCODM",by.y="COD IBGE2")

dim(base_para_mapa)

library(tmap)

tmap_mode("view")

tm_shape(base_para_mapa) + tm_fill("ISS", style="jenks",palette="YlOrRd") +
  tm_borders() + tm_layout(frame=F)


