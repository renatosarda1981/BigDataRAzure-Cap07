setwd("C:/FCD/BigDataRAzure/Cap07")


#Vetores

x <- c('A', 'B', 'C', "D")
x

# Indices Positivos - Elementos em posições específicas

x[c(1,3)]
x[c(1,1)]
x[order(x)]


#Indices Negativos - Ignora elementos em posições específicas

x[-c(1,3)]
x[-c(1,4)]

#Vetor Lógico para gerar subsetting

x[c(TRUE, FALSE)]
x
x[c(TRUE, FALSE, FALSE, TRUE, FALSE)]

y <- setNames(x, letters[1:4])
y

#Matrizes

mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c('A', 'B', 'C')
mat

mat[1:2, ]
mat[1:2, 2:3]

#funçaõ outer() permite que uma matriz se comporte como vetores individuais

vals <- outer(1:5, 1:5, FUN = 'paste', sep = ',')
vals
vals[c(4,15)]

#DataFrame

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$x
df[df$x == 2, ]

#Removendo colunas de dataframe

df$z <- NULL
df

#Operadores [], [[]] e $