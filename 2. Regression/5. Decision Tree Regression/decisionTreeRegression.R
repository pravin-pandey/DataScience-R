# Decision Tree Regression

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//2. Regression//5. Decision Tree Regression')

# Importing Data

df = read.csv('Position_Salaries.csv')
df = df[2:3]

# Fit Decision Trese Regression on dataset
install.packages('rpart')

library(rpart)

regressor = rpart(formula = Salary~., 
                  data = df,
                  control = rpart.control(minsplit = 1)
                  )

summary(regressor)

# Predict new results

y_pred = predict(regressor,data.frame(Level = 6.5))
y_pred

# Visualize the Decision Tree results
library(ggplot2)
x_grid = seq(min(df$Level),max(df$Level),0.1)
ggplot() + 
  geom_point(aes(x=df$Level, y=df$Salary),colour ='red') + 
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level = x_grid))),colour ='blue') +
  ggtitle("Truth or Bluff (Decision Tree Regression)") + 
  xlab('Level')+
  ylab('Salary')