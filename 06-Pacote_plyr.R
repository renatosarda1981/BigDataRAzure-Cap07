setwd('c:/FCD/BigDataRAzure/Cap07')
install.packages('plyr')
install.packages('gapminder')

library(plyr)
library(gapminder)
library(ggplot2)



df <- ddply(gapminder, ~continent,
            summarize,
            max_le = max(lifeExp))

str(df)
head(df)
View(df)
levels(df$continent)

ddply(gapminder, ~ continent,
      summarize,
      n_uniq_countries = length(unique(country)))

ddply(gapminder, ~ continent,
      function(x) c(n_uniq_countries = length(unique(x$country))))

ddply(gapminder, ~continent,
      summarize,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))

data(mpg)
str(mpg)

data <- mpg[,c(1,7:9)]
View(data)

ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty))

ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))

ddply(data, .(manufacturer, drv),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))


