#SVR

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//2. Regression//4. Support Vector Regression')

# Importing Data

df = read.csv('Position_Salaries.csv')
df = df[2:3]

# Fit SVR on dataset
install.packages('e1071')

library(e1071)

regressor = svm(formula = Salary~., data = df, type = 'eps-regression')

# Predict new results

y_pred = predict(regressor,data.frame(Level = 6.5))
y_pred

# Visualize the SVR results
library(ggplot2)
ggplot() + 
  geom_point(aes(x=df$Level, y=df$Salary),colour ='red') + 
  geom_line(aes(x=df$Level, y=predict(regressor, newdata = df)),colour ='blue') +
  ggtitle("Truth or Bluff (Polynomial Regression") + 
  xlab('Level')+
  ylab('Salary')
