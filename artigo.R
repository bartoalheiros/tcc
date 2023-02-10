#################### Carregando pacotes ####################

if (!require(dplyr))
  install.packages("dplyr")

if (!require(gt))
  install.packages("gt")

library(dplyr)
library(readr)
library(gt)


############### Carregando o banco de dados ###############

# Passo 1: selecionar o diret?rio de trabalho (working directory)

setwd("H:/Meu Drive/UFRPE/TCC/artigo/artigo")


# Passo 2: carregar o banco de dados
df <- read.csv('dados-pernambuco-tuberculose-hiv-2012-2022.csv', sep = ';', dec = ',')
df <- data.frame(df)
#View(df)

#pega a quantidade de casos com hiv positivo no ano de 2022
hiv_positivo_2022 <- df[df$HIV == 'Positivo', c('X2012','X2013','X2014','X2015','X2016','X2017','X2018','X2019','X2020','X2021','X2022')]
hiv_positivo_2022 <- rename(hiv_positivo_2022, '2012'='X2012','2013'='X2013','2014'='X2014','2015'='X2015','2016'='X2016','2017'='X2017','2018'='X2018','2019'='X2019','2020'='X2020','2021'='X2021','2022'='X2022')
View(hiv_positivo_2022)
#outro jeito de fazer o mesmo:
#hiv_pos_22 <- subset(df, HIV == "Positivo")$X2022

############### Visualizando o banco de dados ###############
hiv_positivo_2022 <- t(hiv_positivo_2022)
colnames(hiv_positivo_2022) <- "Casos hiv positivo"
View(hiv_positivo_2022)
write.csv2(hiv_positivo_2022, "2012-2022-hiv-tb2.csv", row.names=TRUE)

#X2012_2022_hiv_tb <- read_delim("2012-2022-hiv-tb2.csv", 
#                               delim = ";", escape_double = FALSE, trim_ws = TRUE)
X2012_2022_hiv_tb <- read.csv("2012-2022-hiv-tb2.csv", sep = ';', dec = ',')
View(X2012_2022_hiv_tb)
#df_12_22 <- data.frame(X2012_2022_hiv_tb)
#View(df_12_22)

colnames(X2012_2022_hiv_tb) <- c("Ano","Casos_hiv_positivo")
head(X2012_2022_hiv_tb)
View(X2012_2022_hiv_tb)

plot(X2012_2022_hiv_tb,type = "o")
lines(x = X2012_2022_hiv_tb$Ano,
      y = X2012_2022_hiv_tb$Casos_hiv_positivo,
      col = "red")
