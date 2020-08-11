#to get present working directory
getwd()

#to set new working directory in windows
setwd("C:\\Users\\pravi\\Desktop\\PROJECTS\\Data Science - R\\1. Data PreProcessing")

#reading data GUI
#df = read.csv(file.choose())

#reading data CLI
df = read.csv('Data.csv')

#handling missing data
df$Age = ifelse(is.na(df$Age),
                ave(df$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                df$Age
                )

df$Salary = ifelse(is.na(df$Salary),
                   ave(df$Salary, FUN = function(x) mean(x,na.rm = TRUE)),
                   df$Salary
                   )

#Encoding categorical data
df$Country = factor(df$Country,
                    levels = c("France","Spain","Germany"),
                    labels = c(1,2,3)
                    )

df$Purchased = factor(df$Purchased,
                    levels = c("No","Yes"),
                    labels = c(0,1)
)

#Split the dataset into training and test set
#install.packages('caTools') #for first time users

library(caTools)

set.seed(123)
split = sample.split(df$Purchased, SplitRatio = 0.8)

training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

#Feature Scaling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])

