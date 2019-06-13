

### Deformando os mapas

Mapatradicional<- tm_shape(base) + tm_fill("Vaginal", style="jenks") +
  tm_borders() + tm_layout(frame=F)

uf_vaginal <- cartogram(base, "Vaginal", itermax=4)

anamorfismo<-tm_shape(uf_vaginal) + tm_fill("Vaginal", style="jenks") + tm_borders() + tm_layout(frame=F)
