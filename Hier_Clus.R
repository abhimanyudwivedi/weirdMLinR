#import
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

#dandrogram
dg = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dg,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Distance')

#Hierarchical clustering
dg = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(dg, 5)

#visualizing
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 1,
         plotchar = FALSE,
         span = TRUE,
         Main = paste('Clusters'),
         xlab = 'Income',
         ylab = 'Spending')