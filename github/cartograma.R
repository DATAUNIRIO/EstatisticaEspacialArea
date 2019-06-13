library(tmap)
library(XML)
library(cartogram)


### Deformando os mapas

tm_shape(base) + tm_fill("Vaginal", style="jenks") +
  tm_borders() + tm_layout(frame=F)

uf_vaginal <- cartogram(base, "Vaginal", itermax=4)

tm_shape(uf_vaginal) + tm_fill("Vaginal", style="jenks") + tm_borders() + tm_layout(frame=F)
