#title: "Dimensionality Reduction Tutorial"
#author: "Julian Kanjere"
#date: "August 2019"

#The eurodist gives the road distances (in km) between 21 cities in Europe. 
#The data are taken from a table in The Cambridge Encyclopaedia.
help(eurodist) 

#create matrix, 21 rows x 21 columns
eurodist_mat <- as.matrix(eurodist)

#view matrix
View(eurodist_mat)

?dist
x <- matrix(rnorm(100), nrow = 5)
View(x)
dist(x)