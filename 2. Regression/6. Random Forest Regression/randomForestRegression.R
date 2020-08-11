# Random Forest Regression

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//2. Regression//6. Random Forest Regression')

# Importing Data

df = read.csv('Position_Salaries.csv')
df = df[2:3]

# Fit Random Forest Regression on dataset
install.packages('randomForest')

library(randomForest)
set.seed(1234)
regressor = randomForest(x = df[1],
                         y = df$Salary,
                         ntree =50
                         )

summary(regressor)

# Predict new results

y_pred = predict(regressor,data.frame(Level = 6.5))
y_pred

# Visualize the Random Forest Regression results
library(ggplot2)
x_grid = seq(min(df$Level),max(df$Level),0.1)
ggplot() + 
  geom_point(aes(x=df$Level, y=df$Salary),colour ='red') + 
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level = x_grid))),colour ='blue') +
  ggtitle("Truth or Bluff (Random Forest Regression)") + 
  xlab('Level')+
  ylab('Salary')