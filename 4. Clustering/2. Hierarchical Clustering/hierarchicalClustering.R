# K-Means Clusterin

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//4. Clustering//2. Hierarchical Clustering')

# Importing Data

df = read.csv('Mall_Customers.csv')
X = df[4:5]

# Using dendrogram to find the optimal number of clusters

dendrogram = hclust(dist(X, method='euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distances')

# Fitting hierarchical clustering to the dataset

agc = hclust(dist(X, method='euclidean'), method = 'ward.D')
y_agc = cutree(agc,k=5)

y_agc

# Visualising the clusters

library('cluster')
clusplot(X,
         y_agc,
         lines=0,
         shade = TRUE,
         color=TRUE,
         labels=2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster of clients'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')