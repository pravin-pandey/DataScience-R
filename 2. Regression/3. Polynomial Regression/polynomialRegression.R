# Polynomial Regression
getwd()

setwd("C://Users//pravi//Desktop//PROJECTS//Data Science - R//2. Regression//3. Polynomial Regression")

df = read.csv('Position_Salaries.csv')

head(df)

df = df[2:3]

# Fit Simple Linear Regression on dataset

lr = lm(formula = Salary ~ .,data = df)
summary(lr)

# Fit Polynomial Regression to the dataset

df$level2 = df$Level^2
df$level3 = df$Level^3
df$level4 = df$Level^4

poly_reg = lm(formula = Salary~ .,data = df)
summary(poly_reg)

# Visulaize the Linear Regression results

library(ggplot2)

ggplot() + 
  geom_point(aes(x=df$Level, y=df$Salary),colour ='red') + 
  geom_line(aes(x=df$Level, y=predict(lr, newdata = df)),colour ='blue') +
  ggtitle("Truth or Bluff (Linear Regression") + 
  xlab('Level')+
  ylab('Salary')


# Visualize the Polynomial Regression results

ggplot() + 
  geom_point(aes(x=df$Level, y=df$Salary),colour ='red') + 
  geom_line(aes(x=df$Level, y=predict(poly_reg, newdata = df)),colour ='blue') +
  ggtitle("Truth or Bluff (Polynomial Regression") + 
  xlab('Level')+
  ylab('Salary')

# Predicting a new result with Linear Regression

y_pred = predict(lr, data.frame(Level = 6.5))
y_pred

# Predicting a new result with Polynomial Regression

y_poly_predict = predict(poly_reg, data.frame(Level=6.5,level2=6.5^2,level3=6.5^3,level4=6.5^4))
y_poly_predict

