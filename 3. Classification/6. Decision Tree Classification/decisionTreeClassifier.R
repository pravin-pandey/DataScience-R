# Decision Tree Classifier

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//3. Classification//6. Decision Tree Classification')

# Importing Data

df = read.csv('Social_Network_Ads.csv')

# Encoding the dependent variable as factor

df$Purchased = factor(df$Purchased, levels = c(0,1))

# Splitting dataset into train and test set

library(caTools)
set.seed(123)
split = sample.split(df$Purchased, SplitRatio=0.75)
training_set = subset(df,split==TRUE)
test_set = subset(df,split==FALSE)

#Feature Scaling

training_set[,1:2]= scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])

# Fitting Decision Tree Classifier on training set
install.packages('rpart')
library(rpart)

classifier = rpart(formula = Purchased ~ .,
                 data = training_set,)

classifier

# Predicting test set

y_pred = predict(classifier,newdata = test_set[-3],type='class')
y_pred
# Making confusion matrix

cm = table(test_set[,3], y_pred)

cm

# Visualising the training set

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier,newdata = grid_set,type='class')
plot(set[, -3],
     main = 'Decision Tree Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary',type='class')
y_grid = predict(classifier,newdata = grid_set)
plot(set[, -3],
     main = 'Decision Tree Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#plot decision tree
plot(classifier)
text(classifier)