getwd()

setwd("C://Users//pravi//Desktop//PROJECTS//Data Science - R//2. Regression//1. Simple Linear Regression")

df = read.csv("Salary_Data.csv")

library(caTools)
set.seed(123)
split = sample.split(df$Salary, SplitRatio = 2/3)
training_set = subset(df, split == TRUE)
testing_set = subset(df, split == FALSE)

#Fit Simple Linear Regression on Training set

regressor = lm(formula = Salary ~ YearsExperience, 
               data =training_set)

summary(regressor)

# Predicting the Test set results

y_pred = predict(regressor, newdata = testing_set)

y_pred

# Visualize Training set result

library(ggplot2)

ggplot() + 
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),color='red')+
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),color='blue')

ggtitle("Salary vs Experience(training set)")+
xlab("Years of Experience") + ylab("Salary")

# Visualize test set

ggplot() + 
  geom_point(aes(x=testing_set$YearsExperience, y=testing_set$Salary),color='red')+
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),color='blue')

ggtitle("Salary vs Experience (Test Set)") + xlab("Years of Experience") + ylab("Salary") 


