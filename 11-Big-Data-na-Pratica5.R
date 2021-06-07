# Instalar e carregar os pacotes

install.packages('quantmod')
install.packages('xts')
install.packages('moments')
library(quantmod)
library(xts)
library(moments)

#Seleção do período de analise
startDate = as.Date('2018-01-21')
endDate = as.Date('2018-06-21')

getSymbols('PETR4.SA', src = 'yahoo', from = startDate, to = endDate, auto.assign = T)
#PETR4.SA = readRDS('PETR4.SA.rds')

#checando o tipo de dado retornado
class(PETR4.SA)
is.xts(PETR4.SA)

#Mostra os primeiros registros para as ações da Petrobras

head(PETR4.SA)
View(PETR4.SA)

#Analisando os dados de fechamento

PETR4.SA.Close <- PETR4.SA[, 'PETR4.SA.Close']
is.xts(PETR4.SA.Close)
head(Cl(PETR4.SA), 5)

#Grafico
candleChart(PETR4.SA)

#Plot do fechamento

plot(PETR4.SA.Close, main = 'Fechamento Diário Ações Petrobras', 
     col = 'red', xlab = 'Data', ylab = 'Preço', major.ticks = 'months',
     minor.ticks = FALSE)

#Adicionar as bandas de bollinger ao gráfico, com media de 20 periodos e 2 desvios


addBBands(n = 20, sd = 2)
addADX(n= 11, maType = 'EMA')

#Calculando logs diários
PETR4.SA.ret <- diff(log(PETR4.SA.Close), lag = 1)

#Removendo valores NA na posição 1
PETR4.SA.ret <- PETR4.SA.ret[-1]

# Plotar a taxa de retorno

plot(PETR4.SA.ret, main ='Fechamento Diário das PETR4.SA.statsAções da Petrobras',
     col = 'red', xlab = 'Data', ylab = 'Retorno', major.ticks = 'months',
     minor.ticks = FALSE)

#Calculando algumas medidas estatisticas

statNames <- c('Mean', 'Standard Deviation', 'Skewness','Kurtosis')
PETR4.SA.stats <- c(mean(PETR4.SA.ret), sd(PETR4.SA.ret), skewness(PETR4.SA.ret), kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats) <- statNames
PETR4.SA.stats






