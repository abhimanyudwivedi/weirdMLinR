dataset = read.csv('Mall_Customers.csv')
X <- dataset[4:5]

#KMEANS elbow
set.seed(6)
wcss <- vector()
for (i in 1:10) {
  wcss[i] <- sum(kmeans(X, i)$withinss)
}
plot(1:10, wcss, type = "b", main = paste("Clusters"), xlab = "Number of clusters", ylab = "wcss")

#applying kmeans with 5 clusters
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

#visualize
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 1,
         shade = TRUE,
         color = TRUE,
         labels = 0,
         plotchar = FALSE,
         span = TRUE,
         main = paste("KMEANS"),
         xlab = "Annual income",
         ylab = "Spending"
)