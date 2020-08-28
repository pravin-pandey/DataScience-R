# K-Means Clusterin

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//4. Clustering//1. K-Means Clustering')

# Importing Data

df = read.csv('Mall_Customers.csv')
X = df[4:5]

# Use elbow method to find optimal no.of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X,i)$withinss)
plot(1:10,wcss,type='b',main = paste('Clusters of Clients'),xlab = 'Number of clusters', ylab ="WCSS")
    
# Fitting Kmeans 
set.seed(29)
kmeans <- kmeans(X,5,iter.max=300,nstart=10)

#Visualising the Kmeans cluster

library('cluster')
clusplot(X,
         kmeans$cluster,
         lines=0,
         shade = TRUE,
         color=TRUE,
         labels=2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster of clients'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')