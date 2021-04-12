
# Remodelagem de dados com tidyr

library(tidyr)
library(ggplot2)

# Dados
dados <- data.frame(
  nome = c("Georgia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)

dados
# criar duas novas colunas a partir de duas colunas
dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B)

# Criando dados
set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)
df2

# reshape 1

df2_organizado1 <- df2 %>%
  gather(key, time, -id, -acao)
df2_organizado1 %>% head(8)

# reshape 2

df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c('localidade', 'tempo'), sep = '\\.')
df2_organizado2 %>% head(8)
?separate

# mais um example

set.seed(1)

df3 <- data.frame(
  participante = c('p1', 'p2', 'p3', 'p4', 'p5',"p6"),
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15),
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)


df3

# reshape dos dados

df3 %>%
  gather(day, score, c(day1score, day2score))











