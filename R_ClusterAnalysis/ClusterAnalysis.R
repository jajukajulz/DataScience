#title: "Cluster Analysis Tutorial (Unsupervised Learning)"
#author: "Julian Kanjere"
#date: "October 2019"

#Cluster Analysis.
# Grouping of items based on similarity/dissimilarity given by a distance measure.

#1. kMeans Clustering
# ABC

#2.	Hierarchical Clustering
# hc_complete <- hclust(distance) gives a cluster dendrogram with complete linkage
# to obtain cluster dendrogram you use plot() command i.e. plot(hc_complete)
# to add labels to cluster dendrogram you add labels to plot() command i.e. plot(hc_complete, labels=row_labels)
# to make the labels aligned, use hang attribute i.e. plot(hc_complete, labels=row_labels, hang = -1)
# initially each observation is treated as a single cluster then based on distance you join clusters, this process is repeated until all observations are linked to each other


#3. Density Based (DBSCAN)
# ABC


####################START kMeans USING PSL DATASET##########################################################
#The PSL dataset was scraped from South African Premier Soccer League website.
# Requires quantitative variables.
# Normalize variables (mean becomes zero and std dev becomes 1) which levels playing field so that there are no variables that dominate the analysis.
# Calculate Euclidean distance using dist()
####################END kMeans USING PSL DATASET##########################################################

