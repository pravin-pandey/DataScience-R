# Mutiple Linear Regression
getwd()

setwd("C://Users//pravi//Desktop//PROJECTS//Data Science - R//2. Regression//2. Multiple Linear Regression")

df = read.csv("50_Startups.csv")

# Encoding categorical data

df$State = factor(df$State,
                  levels = c('California','Florida','New York'),
                  labels = c(1,2,3)
                  )

# Splitting Dataset
library(caTools)
set.seed(123)
split = sample.split(df$Profit,SplitRatio = 2/3)
training_set = subset(df, split == TRUE)
testing_set = subset(df, split == FALSE)

# Fit Simple Linear Regression on Training set

#regressor = lm(fromula = Profit~R.D.Spend+Administration+
#                 Marketing.Spend+State, data=training_set)

# or you can use if all the other arguments are independent variables

regressor = lm(fromula = Profit ~ . , data=training_set)

summary(regressor)

# Predicting the Test set results

y_pred = predict(regressor, new_data = testing_set)

y_pred









