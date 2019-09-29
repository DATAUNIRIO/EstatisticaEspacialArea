
#----------------------------------------------------------------------------------------
# FUNCAO PARA GERAR MAPAS DO
# PROFESSOR ALEXANDRE SILVA 
#----------------------------------------------------------------------------------------

mapa <- function(valor, titulo,cor){
  brks <- round(quantile(valor,probs=seq(0,1,0.25)),3)
  cols <- cor
  plot(base, col=cols[findInterval(valor, brks)])
  legend("bottomleft",legend=leglabs(brks, "<", ">="),fill=cols, bty="n", cex=0.8)
  title(main=titulo)
}