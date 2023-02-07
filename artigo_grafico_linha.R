#################### Carregando pacotes ####################

if (!require(dplyr))
  install.packages("dplyr")

library(dplyr)


############### Carregando o banco de dados ###############

# Passo 1: selecionar o diret?rio de trabalho (working directory)

setwd("H:/Meu Drive/UFRPE/TCC/artigo/artigo")


# Passo 2: carregar o banco de dados
df <- read.csv('2012-2022-hiv-tb.csv', sep = ';', dec = ',')
df <- data.frame(df)
View(df)