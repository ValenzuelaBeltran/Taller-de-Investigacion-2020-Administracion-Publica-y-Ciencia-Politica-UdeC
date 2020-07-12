#'---
#'title: "Visualización de datos"
#'author: "Macarena Valenzuela Beltrán"
#'date: "8 de julio"
#'output: github_document
#'---

#' Llamamos a la librería

library(tidyverse)

#' Llamamos a la base de datos mpg

ggplot2::mpg

#'preguntamos de que trata la base de datos mpg
?mpg

#' Hacemos un view de mpg

view(mpg)

#' el primer gráfico

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

#' veamos el desplazamiento en carretera por clase de auto
 
ggplot(data= mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))+
  facet_wrap(~class, nrow = 2)

           