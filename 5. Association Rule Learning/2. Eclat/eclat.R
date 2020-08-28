# Eclat

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//5. Association Rule Learning//2. Eclat')

# Data Preprocessing
install.packages('arules')
library(arules)
#df = read.csv('Market_Basket_Optimisation.csv',header = FALSE)

df = read.transactions('Market_Basket_Optimisation.csv',
                       sep=',',
                       rm.duplicates = TRUE)

summary(df)
itemFrequencyPlot(df,topN = 10)

# Training Eclat on the dataset

rules = eclat(data = df,
               parameter = list(support = 0.004, minlen = 2))

# Visualizing the results

inspect(sort(rules, by = 'support')[1:10])










