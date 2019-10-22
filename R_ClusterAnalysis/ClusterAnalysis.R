#title: "Cluster Analysis Tutorial (Unsupervised Learning)"
#author: "Julian Kanjere"
#date: "October 2019"

#Cluster Analysis.
# Grouping of items based on similarity/dissimilarity given by a distance measure. Clustering is an unsupervised machine learning method for partitioning dataset into a set of groups or clusters. A big issue is that clustering methods will return clusters even if the data does not contain any clusters.
# Therefore, it’s necessary i) to assess clustering tendency before the analysis and ii) to validate the quality of the result after clustering.

#1. kMeans Clustering
# use normalized dataset
# kc <- kmeans(normalized_dataset, number_of_clusters)
# plot(variable1~variable2, dataset, col=kc$cluster) #plot variable1 against variable2 and colour the observations by cluster
# normalized_dataset_2 <- cbind(normalized_dataset,kc$cluster) #add the cluster label output to your data
# write.csv(x = normalized_dataset_2, file = "normalized_dataset_2.csv") #write your data to a csv
# output of kmeans() gives summary of cluster sizes, cluster means (i.e. kc$center), cluster membership vector,
# within cluster sum of squares by cluster - the lower the within cluster sum of squares, the lower the variability and the closer the observations are in terms of distance.

#2.	Hierarchical Clustering
# hc_complete <- hclust(distance) gives a cluster dendrogram with complete linkage
# to obtain cluster dendrogram you use plot() command i.e. plot(hc_complete)
# to add labels to cluster dendrogram you add labels to plot() command i.e. plot(hc_complete, labels=row_labels)
# to make the labels aligned, use hang attribute i.e. plot(hc_complete, labels=row_labels, hang = -1)
# initially each observation is treated as a single cluster then based on distance you join clusters, this process is repeated until all observations are linked to each other
# cluster membership can be viewed by cutting the tree using cutree() and specifying number of clusters e.g. cutree(hc_complete, k = 3)

# hc_average <- hclust(distance, method = "average") gives a cluster dendrogram with average linkage

# compare cluster formation between complete linkage and average linkage (External clustering validation)
# cluster_members_complete <- cutree(hc_complete, k = 3)
# cluster_members_average <- cutree(hc_average, k = 3)
# table(cluster_members_complete, cluster_members_average)

# compare cluster means for the different variables to get an idea of which variables influence cluster membership
# i.e. if cluster means for a variable are not too different then that variable does not strongly influence cluster membership
# aggregate(dataset, list(cluster_members_complete), mean)


#3. Density Based (DBSCAN)
# ABC

# Determine the optimal number of clusters
# 1. Scree plot elbow
# scree plot
# within group sum of squares (i.e. within group variability) - optimal number of clusters is where you have the last largest drop in number of clusters


# 2. Many indices - use NbClust() and choose best number of clusters according to the majority rule
#  Compute the number of clusters
# library(NbClust)
# nb <- NbClust(scaled_dataset, distance = "euclidean", min.nc = 2, max.nc = 10, method = "complete", index ="all")

# Visualize the result
# library(factoextra)
# fviz_nbclust(nb) + theme_minimal()

# Internal clustering validation measures
# The goal of clustering algorithms is to split the dataset into clusters of objects, such that objects in the same cluster are similar as much as possible and objects in different clusters are highly distinct.
# i.e. The average distance within cluster should be as small as possible; and the average distance between clusters should be as large as possible.

# Silhouette plot
# Silhouette refers to a method of interpretation and validation of consistency within clusters of data. The technique provides a succinct graphical representation of how well each object has been classified.
# Silhouette analysis measures how well an observation is clustered and it estimates the average distance between clusters. The silhouette plot displays a measure of how close each point in one cluster is to points in the neighboring clusters.
# If many points have a low or negative value, then the clustering configuration may have too many or too few clusters.
# If only a handful have negative values, then they are possibly outliers
# silhouette width is also an estimate of the average distance between clusters. Its value is comprised between 1 and -1 with a value of 1 indicating a very good cluster.
# Silhouette width (Si) can be interpreted as follows: Observations with a large Si (almost 1) are very well clustered, A small Si (around 0) means that the observation lies between two clusters, Observations with a negative Si are probably placed in the wrong cluster.

# External clustering validation
# Objective is to compare the identified clusters (by k-means, hierarchical clustering, PAM etc) to a known reference (truth).
# To compare two cluster solutions, use cluster.stats() function e.g. results.stat <- cluster.stats(d, solution1$cluster, solution2$cluster)
# Alternatively cross tabulation between 2 cluster techniques or 1 cluster technique and truth e.g. table(iris$Species, km.res$cluster)

####################START kMeans USING PSL DATASET##########################################################
#The PSL dataset was scraped from South African Premier Soccer League website.
# Requires quantitative variables.
# Normalize variables (mean becomes zero and std dev becomes 1) which levels playing field so that there are no variables that dominate the analysis.
# Calculate Euclidean distance using dist()
####################END kMeans USING PSL DATASET##########################################################

