#title: "Dimensionality Reduction Tutorial - Principal Component Analysis (PCA)"
#author: "Julian Kanjere"
#date: "August 2019"

#Principal Component Analysis (PCA) is a dimensionality reduction technique used to find the core components of a dataset
#especially when there is a huge number of variables (in some cases when the number of variables is more than the
#number of observations. PCA employs orthogonal (perpendicular) transformations that best explain the variance of the data.
#PCA results in a lower-dimensional image of the data, where the uncorrelated principal components are the linear combinations of the original
#variables. Put another way, the goal of PCA is to find the best low-dimensional representation of the variation in a multivariate dataset .

####################START PCA USING MTCARS DATASET and PRCOMP()##########################################################
#The mtcars data set (Motor Trend Car Road Tests) was extracted from the 1974 Motor Trend US magazine,
#and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).
#It consists of 32 observations (i.e. n) on 11 (numeric) variables (i.e P).

help(mtcars)


#view dataset - 32 x 11
View(mtcars)

#Run PCA, scaling the data results in data with unit variance, PCA requires a matrix as an input
#This (prcomp()) returns the standard deviations of the principal components, which shows how much information was
# preserved by the 11 components.
pca.mtcars <- prcomp(mtcars, scale = TRUE)

#view the stddev, rotation, centering, scaling etc.
View(pca.mtcars)

#View Importance of components i.e. Standard Deviation, Proportion of Variance explained etc
#The standard deviation of the first component is expected to be larger (often a lot larger) than any other subsequent value)
#The components with standard deviation higher than one include at least as much information as the original variables did
# (i.e. indicate which variables have a higher eigenvalue than one).
summary(pca.mtcars)


# Eigenvalue is the square of the standard deviation of the principal components.
# This sums up to the number of variables in the original dataset
pca.mtcars.eigenvalue.sum <- sum((pca.mtcars)$sdev^2)
pca.mtcars.eigenvalue.sum #this should be 11 since original data had 11 variables

#Number of principal components returned by PCA algorithms always the same as the number of features/variables in the original dataset
#The strength/importance of the principal components decreases from the first one to the last one.
#Rule of a thumb is to keep the components with standard deviation > 1 (which also means a variance greater than 1)
#i.e. we keep the Principal Components that explain as much variance as the original variables do
#preceding summary suggests keeping only two components out of the 11,
pca.mtcars.eigenvalue <- (pca.mtcars)$sdev^2
pca.mtcars.eigenvalue #we keep the first 2 PC's i.e. (6.6 + 2.65) / 11 = 0.8409091 (they explain approx 85% of the variance)
#NB this is similar to the cumulative proportion on PC2 from the summary


#Another option for determining the optimal number of Principal Components to keep is to use the scree plot
#VSS.scree() from psych package gives you a scree plot with eigenvalue vs component number
library(psych)
VSS.scree(cor(mtcars)) # optimal number of components is those with eigenvalue above 1 (Kaiser criterion)

#view the first two principal components (since we have seen that the first two are worth keeping)
View(pca.mtcars$x[, 1:2])


#The PC values were computed by a standard linear transformation -  multiplying the original dataset with the identified weights i.e. loadings (rotation)
#The rotation matrix is also known as the component matrix or the loadings matrix.
# i.e. (scale(mtcars) %*% pca.mtcars$rotation[, 1:2])

#The Principal Components are are scaled with the mean 0 and standard deviation 1
#we use summary() to view the min, 1st quartile, mean, median, 3rd quartile, max
summary(pca.mtcars$x[, 1:2])

#To view std dev calculated columnwise for PC1 and PC2
apply(pca.mtcars$x[, 1:2], 2, sd)

#This would be identical to the sd that is already in our pca.mtcars object
pca.mtcars$sdev[1:2]

#The calculated Principal Components are not correlated because scaling is carried out and the PC's are transformed to a
#new coordinate system with an orthogonal basis
round(cor(pca.mtcars$x))

#Use a biplot to interpret the Principal Components. The biplot shows the observations (labelled in black) on the same plot
#with the new coordinate system based on the principal components (shown in red for each of the features)
#The axis at the top (PC1) and the right hand side (PC2) is for the observations and principal components pca.mtcars$x[, 1:2]
#The axis on the bottom (PC1) and left hand side (PC2) is for the features and the rotation values pca.mtcars$rotation[, 1:2]
biplot(pca.mtcars, cex = c(0.8, 1.2))
abline(h = 0, v = 0, lty = 'dashed')

#from the plot:
#the top 4 features based on absolute values for PC1 are number of cylinders (cyl), displacement (disp), weight (wt), and gas consumption (mpg)
#the top 4 features absolute values for PC2 are speedup(qsec), number of gears (gear), carburetors (carb), and the transmission type (am)

#to verify details from plot we can compute the correlation coefficient between the original variables and the principal components:
cor(mtcars, pca.mtcars$x[, 1:2])

#maybe we can call PC1 consumption features and PC2 tranmission characteristics

####################END PCA USING MTCARS DATASET##########################################################
