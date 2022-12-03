library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(tidyverse)
library(readr)
library(haven)

#Primero leer la data
data_at <- read_sav("A_T_CAPITULO_100.sav")

#Cargar columnas de analisis y visualizacion general de las mismas
heridos <- data_at$AT108_2
vehiculos <- data_at$AT106_1_CANT

glimpse(heridos) #Numeric
glimpse(vehiculos) #Numeric

#Visualizar distribucion de la data
plot(heridos ~ vehiculos, data = data_at)

#Hacer la regresión
data_at_lm <- lm(heridos ~ vehiculos, data = data_at)

#Ver data de regresión
summary(data_at_lm)

#Analisis de residuales
par(mfrow=c(2,2))
plot(data_at_lm)
par(mfrow=c(1,1))

#Graficar los resultados de regresión
graph <- ggplot(data_at, aes(x=vehiculos, y=heridos)) + geom_point()
graph <- graph + geom_smooth(method='lm', col='blue')
graph <- graph + stat_regline_equation(label.x = 3, label.y = 7)
graph

relation <- lm(vehiculos~heridos)
#Crear un archivo
png(file = "linearregression.png")
# Plot
plot(vehiculos,heridos, col = "blue", main = "Regresión de vehículos y heridos en choques de autos",
abline(lm(vehiculos~heridos)), cex = 1.3, pch = 16, xlab = "vehiculos", ylab = "heridos")
# Save
dev.off()