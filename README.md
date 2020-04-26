# Estatistica Espacial para dados de areas e de pontos  

# funcao para criar um dataframe para facilitar o merge com shapefiles.
# baseada no trabalho do José de Jesus Filho
# fazer o mesmo para os municipios do rio
df<-c()
funcao_estados<-function(x){  
  CODIGO<-c(12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17)
SIGLAS<-c("AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO")
  NOMES<-c("Acre","Alagoas","Amapá","Amazonas","Bahia","Ceara","Distrito Federal",
           "Espírito Santo","Goiás","Maranhão","Mato Grosso","Mato Grosso do Sul",
           "Minas Gerais","Pará","Paraíba","Paraná","Pernambuco","Piauí","Rio de Janeiro",
           "Rio Grande do Norte","Rio Grande do Sul","Rondônia","Roraima","Santa Catarina",
           "São Paulo","Sergipe","Tocantins")
  
  df<-data.frame(CD_GEOCODU=CODIGO,SIGLA=SIGLAS, NOME=NOMES,stringsAsFactors = F)
  return(df)
}


funcao_municipios<-function(x){  
  CODIGO<-c()
  NOMES<-c()
  df<-data.frame(CD_GEOCODU=CODIGO, NOME=NOMES,stringsAsFactors = F)
  return(df)
}

banco_com_siglas<-funcao_estados()
bancoRJ_com_siglas<-funcao_municipios()
banco_com_siglas


-----------------------------------------------------------------------------------------------------------------

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
