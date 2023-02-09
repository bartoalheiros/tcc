#################### Carregando pacotes ####################

if (!require(dplyr))
  install.packages("dplyr")

library(dplyr)
library(readr)


############### Carregando o banco de dados ###############

# Passo 1: selecionar o diret?rio de trabalho (working directory)

setwd("H:/Meu Drive/UFRPE/TCC/artigo/artigo")


# Passo 2: carregar o banco de dados
df <- read.csv('dados-pernambuco-tuberculose-hiv-2012-2022.csv', sep = ';', dec = ',')
df <- data.frame(df)
View(df)

#pega a quantidade de casos com hiv positivo no ano de 2022
hiv_positivo_2022 <- df[df$HIV == 'Positivo', c('X2012','X2013','X2014','X2015','X2016','X2017','X2018','X2019','X2020','X2021','X2022')]
#outro jeito de fazer o mesmo:
#hiv_pos_22 <- subset(df, HIV == "Positivo")$X2022

############### Visualizando o banco de dados ###############
hiv_positivo_2022_novo <- t(hiv_positivo_2022)
colnames(hiv_positivo_2022_novo) <- "Casos hiv positivo"
names(hiv_positivo_2022_novo)[names(hiv_positivo_2022_novo) == ''] <- 'Ano'

plot(hiv_positivo_2022_novo,type = "o")
write.csv2(hiv_positivo_2022_novo, "2012-2022-hiv-tb.csv", row.names=TRUE)

View(hiv_positivo_2022_novo)
View(hiv_positivo_2022)

X2012_2022_hiv_tb <- read_delim("2012-2022-hiv-tb.csv", 
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
df_12_22 <- data.frame(X2012_2022_hiv_tb)
View(df_12_22)

df_12_22_nova = df_12_22 %>% mutate('...1' = NULL)
head(df_12_22_nova)
