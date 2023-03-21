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


# carrega o banco de dados
df <- read.csv2('dados-pernambuco-tuberculose-hiv-2012-2022.csv', sep = ';', dec = ',')
# remove a última coluna do dataframe('Total')
#df <- df[,-13]
#View(df)
df <- rename(df, '2012'='X2012','2013'='X2013','2014'='X2014','2015'='X2015','2016'='X2016','2017'='X2017','2018'='X2018','2019'='X2019','2020'='X2020','2021'='X2021','2022'='X2022')
#df2 <- subset(df,id == 2 )
#summarize(df)
#criar tabela
df %>%
  gt()
  
#df %>%
 # filter(HIV == "Positivo" & HIV == "Negativo") %>%
  #gt()

#gráfico de linha
#pega a quantidade de casos com hiv positivo no ano de 2022
hiv_positivo_2022_pos <- df[df$HIV == 'Positivo', c('2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022')]
#is.character(hiv_positivo_2022_pos)
hiv_positivo_2022_pos_num <- as.numeric(hiv_positivo_2022_pos)
trunc(mean(hiv_positivo_2022_pos_num))
hiv_positivo_2022_tot <- df[df$HIV == 'Total', c('2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022')]
View(hiv_positivo_2022_pos)
View(hiv_positivo_2022_tot)
#outro jeito de fazer o mesmo:
#hiv_pos_22 <- subset(df, HIV == "Positivo")$X2022

############### Visualizando o banco de dados ###############
hiv_positivo_2022_pos <- t(hiv_positivo_2022_pos)
colnames(hiv_positivo_2022_pos) <- "Casos hiv positivo"
View(hiv_positivo_2022_pos)
write.csv2(hiv_positivo_2022_pos, "2012-2022-hiv-tb2.csv", row.names=TRUE)

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

#lê tabela 2
tabela_2 <- read.csv("tabela2.csv", sep = ';', dec = ',')
tabela_2 <- tabela_2[-1,]
View(tabela_2)

colnames(tabela_2) <- c("Variáveis","N","%")
#if(tabela_2[colnames(tabela_2)[]]=="Forma cl<ed>nica") {
 # tabela_2[25,"Variáveis"] <- "Forma"
  #print("entrou no if")
#}
tabela_2$Variáveis[tabela_2$Variáveis == "Forma cli\u0301nica"] <- "Forma"

tabela_2 %>%
  gt() %>%
  tab_header(md("**Coinfecção HIV/TB em PE de 2012 a 2022**"),
             subtitle = "Uma visão geral")

write.csv2(tabela_2, "tabela2_mod.csv", row.names=TRUE)
