#title: "Dimensionality Reduction Tutorial"
#author: "Julian Kanjere"
#date: "August 2019"

####################START MDS USING EURODIST DATASET##########################################################
#The eurodist gives the road distances (in km) between 21 cities in Europe. 
#The data are taken from a table in The Cambridge Encyclopaedia.
#i.e. eurodist is already an existing distance matrix (in contrast with a n x P dataset that we 
#would need to run dist(dataset_name) in order to return an n x n distance matrix where n is number 
#observations and P is number of features)
help(eurodist) 

#create matrix, 21 rows x 21 columns
#the distance matrix represents the travel distance between 21 European cities in kilometers
eurodist_mat <- as.matrix(eurodist)

#view matrix
View(eurodist_mat)

#Run classical MDS 
#NB - this would have similar results to a PCA that returns 2 PC's i.e. prcomp(eurodist)$x[, 1:2]
mds <- cmdscale(eurodist) 

#view scores
View(mds)

#Plotting the results
#Now that the 21-dimensional space has been transformed/reduced into 2 dimensions, we can plot and easily visualise
#this would have been hard with the original 21 x 21  distance matrix
plot(mds, type = 'n')
text(mds[, 1], mds[, 2], labels(eurodist))

#Cleaner plot using ggplot
library(ggplot2)
ggplot(as.data.frame(mds), aes(V1, -V2, label = rownames(mds))) + geom_text(check_overlap = TRUE) + theme_minimal() 
####################END MDS USING EURODIST DATASET##########################################################

####################START CREATE DISTANCE MATRIX USING RANDOM DATA##########################################################

?dist

#create a 5 x 20 matrix by sampling from a Normal distribution
x <- matrix(rnorm(100), nrow = 5)

#view matrix
View(x)

#create a distance matrix
dist(x)
####################END CREATE DISTANCE MATRIX USING RANDOM DATA##########################################################
