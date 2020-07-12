#'---
#'title: "Introducción al ambiente de R"
#'author: "Macarena Valenzuela Beltrán"
#'date: "8 de julio"
#'output: github_document
#'---

#' #**Estructura de ambiente R**
#' 
#' ##**Familiarizarse con el teclado**
#' 
#' Recordar algunos shortcut
#' 
#' ctrl + shift (command) + r -> insertar intersección
#' 
#' ctrl + shift + O -> para ver lista costado lateral derecho
#' 
#' alt + shift + k -> para ver toda la lista de keyboard shortcut
#' 
#' creacmos File -> "new project" en R
#' 
#' verificamos el archivo en el computador local
#' 
#' creamos carpeta de scripts,  graficos y data
#' 
#' comprobar donde está nuestra carpeta y archivos
#' 
#' ctrl + enter -> para correr códigos
#' 
#' buscamos en que parte de nuestro directorio no encontramos
#' 
#' 
getwd()

#' **Instalación de librerías** 

library(tidyverse)

#' Llamamos a la base de datos diamonds

diamonds

#' para saber que tiene la base de datos 

?diamonds

#' para ver la tabla completa

view(diamonds)

#' para guardar en el ambiente de r

#'write_csv(diamonds, "Data/diamonds_csv")

#' gurdar script, gráficos y bases de datos

ggplot(diamonds, aes(carat, price))+
  geom_hex()

#' ggsave("Gráficos/diamonds_hex.pdf")
#' 
#' 
#' **Importación de datos**
#' 
#' * read_csv() lee ficheros separados por coma ','
#' 
#' * read_csv2() lee ficheros separados por punto y coma ';''
#' 
#' * read_tsv() lee ficheros separaso por tabulador '\t'
#' 
#' * read_delim() lee ficheros separados por lo que nosotros le digamos
#' 
#' * read_fwf() ficheros de anchura fija
#' 
#' * fwf_widths()
#' 
#' * fwf_positions()
#' 
#' * read_table()
#' 
#' * read_log() ficheros de un server creados por apache
#' 
#' * install.packages("webreadr")
#' 
#' **Ficheros creados con python u otros tipos de fichero**
#' 
#' *install.packages("feather")#implementa un formato de lenguaje binario super rÃ¡pido
#' 
#' *library(feather)#puede ser incluido en otros lenguajes (python, etc)
#'
#' *write_feather(challenge, "data/challenge.feather")
#'
#' *read_feather("data/challenge.feather")
#'
#' *write.csv(challenge, "data/challenge.csv")
#'
#' *read_csv(challenge, "data/challenge.csv", guess_max = 1001)
#'
#' *write_rds(challenge, "data/challenge.rds")#tipo de archivo especial de R
#'
#' *read_rds("data/challenge.rds")




