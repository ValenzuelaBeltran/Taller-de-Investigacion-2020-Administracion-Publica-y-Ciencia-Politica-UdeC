#'---
#'title: md("Transformación de datos")
#'author: "Macarena Valenzuela Beltrán"
#'date: "8 de julio"
#'output: github_document
#'---



#'Transformación de datos 

#' El paquete dplyr tiene 5 funciones para transformar los datos

#'* filter() -> filtra las observaciones a partir de valores concretos

#'* arrange()-> reordena las filas
#'
#'* select() -> selecciona las vasriables con sus respectivos nombres
#'
#'* mutate() -> crear nuevas variables a partir de las existentes
#'
#'* sumarise()-> colapsa valores seleccionados para dar un resumen 
#' de los mismos (media, rango, la mediana, la sd)
#' 
#'* group_by -> opera la función a la que acompaña grupo a grupo


#' llamamos la librería de tidyverse y vemos sus subpaquetes

library(tidyverse)

#'llamamos la librería de la base de datos que vamos a ocupar

library(nycflights13)

#'seleccionamos la base de datos flights desde la gran 

#'base de datos nycflights13

nycflights13::flights

#'para saber que es lo que contiene la base de datos flights

?flights

#'para ver la base de datos completa

view(flights)

#'Comencemos a hacer transformación de datos

#'** Función filter()**

#'Veamos todos los vuelos que salieton el 1° de enero

filter(flights, month==1, day==1)

vuelosenero <- filter(flights, month==1, day==1)

vuelosenero

view(vuelosenero)

#'para saber los vuelos en mi cumpleaños

vuelos28dic <- filter(flights, month == 12, day == 28) 

vuelos28dic

view(vuelos28dic)

#'¿En qué día salen mas vuelos: el 1° de enero o el 25 de diciembre?

filter(flights, month == 12, day == 25)

filter(flights, month==1, day==1)

#' Manejo de los datos no disponibles NA (Not Available)

#' Los NA son contagiosos: cualquier operación que involucre un resultado
#' NA dará como resultado NA

10 == NA

NA >0
NA + 5
NA / 5

#' Si tengo una base y quiero sacar el promedio y entre
#' 
#'los datos se encuentra aunque sea un solo NA, el resultado
#'
#' promedio será NA

#'la tía María tiene edad desconocida

edad.maría<- NA

#'al tío Pedro no lo veo hace mucho años, por tanto no sé 
#'cuantos años tiene ahora

edad.pedro<- NA

edad.maría==edad.pedro

#'Para controlar el contagio de los NA usamos la función 
#'is.na()

is.na(edad.maría)

df<-tibble(x= c(1,2, NA, 4, 5))

df

#' filtramos la base de datoa df para saber cuales son
#' los calores mayores a 2

filter(df, x>2)

#'los datos NA pueden aparecer en forma explícita 
#'y en forma implícita

roi<-tibble(
  year=c(rep(2016, 4), rep(2017, 4), 2018),
  quarter=c(rep(c(1,2,3,4), 2), 1),
  return=rnorm(9, mean = 0.5, sd= 1)
)

roi$return[7]

roi %>% 
  spread(year, return)

#'para solucionar ocupamos la función na.rm()



#'**función arrange()**
#'para ver las primeras variables y las primeras filas

head(flights)

#'para ver las primeras 15 filas

head(flights, 15)

#' para ver las últimas filas de la base de datos

tail(flights, 10)

#' para ordenar la base de datos por año

arrange(flights, year)

#' para ordenar por año, mes y por día

arrange(flights, year, month, day)

salida_dato<-arrange(flights, year, month, day)

salida_dato

tail(salida_dato)

#'ordenar de mayor a menor utilizamos la función 
#'desc()

arrange(flights, desc(arr_delay))

#'ordenar los primeros datos en forma descendente

head(arrange(flights, desc(arr_delay)))

#'para hacer un view de los carrier

view(arrange(flights, carrier))

#'cuáles son los vuelos que recorrieron menos

view(arrange(flights, distance))

#'para observar las distancia de los vuelos recorridos en orden

view(arrange(flights, desc(distance)))

#' **función select()**

#'programación básica
#'seleccionar solo fila 1

view(salida_dato[1,])

#'seleccionemos de la base de datos desde las filas 1 a la 3 y todas las columnas

view(salida_dato[1:3, ])

view(salida_dato [1024:1068, ])

#'de las filas anteriores solo seleccionamos las variable dep_delay y arr_delay

view(select(salida_dato [1024:1068,], dep_delay, arr_time))

#'seleccionando los nombres de las variables

view(select(flights, year, month, day))

#'desde y hasta

view(select(flights, dep_time:arr_delay))

#'solo queremos seleccionar todas las variables menos 2 en específico

view(select(flights, -(year:day)))

#'seleccionamos todas las variables que comiencen con la dep

view(select(flights, starts_with("dep")))

#'seleccionar todas las variables que terminen con delay

view(select(flights, ends_with("delay")))

#'seleccionar todas las variables que contengan una s

view(select(flights, contains("s")))

#' **Función mutate**
#' 
#' La función mutate nos permite transformar las variables para obtener una varable distinta que sea de nuestro interés
#' Llamamos a la base de dato
library(nycflights13)

#' seleccionamos solo la base de datos flights
nycflights13::flights

#' para ver la base de datos completa

view(flights)

#' Para ver la ganancia de tiempo

flights_nueva <- select(flights, year:day, ends_with("delay"), distance, air_time)

view(flights_nueva)

fights_nueva <- mutate(flights_nueva, tiempo_gan = arr_delay - dep_delay,
       air_time_hour = air_time/60,
       flight_speed = distance/air_time_hour,
       tiempo_gan_por_hora = tiempo_gan/air_time_hour)

view(flights_nueva)

#' **función () summarise y group_by**
#' 
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_month_group <- group_by(flights, year, month)

summarise(by_month_group, delay = mean(dep_delay, na.rm = T))

#' veamos esta misma funcióno pero con un grupo por día
#' 
by_day_group <- group_by(flights, year, month, day) 

summarise(by_day_group, delay = mean(dep_delay, na.rm = T))

