install.packages("haven")
library(haven)


#SAS
vendas <- read_sas('vendas.sas')
class(vendas)
print(vendas)
str(vendas)

#Stata

df_stata <- read_dta('mov.dta')
class(df_stata)
str(df_stata)
head(df_stata)

#Pacote Foreign

install.packages('foreign')
library(foreign)

florida <- read.dta('florida.dta')
tail(florida)
class(florida)

#SPSS

dados <- read.spss('international.sav')
class(dados)
head(dados)
df <- data.frame(dados)
head(df)

boxplot(df$gdp)

cor(df$gdp, df$f_illit)