#title: "Collection of useful (and unrelated) R code snippets"
#author: "Julian Kanjere"
#date: "August 2019"

#remove all the objects from the workspace
rm(list=ls())

#set working directory to path of currently open script
library(rstudioapi)
current_path = rstudioapi::getActiveDocumentContext()$path  #Get path of current open file
setwd(dirname(current_path ))#setworking directory
print( getwd() )

#set seed so that sampling can be reproduced in future
set.seed(10)

#80%/20% Train Test Split
train = sample(1:nrow(mtcars), nrow(mtcars)*.80)
mtcars.test = mtcars[-train,]
mtcars.train = mtcars[train,]

#view first 6 rows and all columns (features) of dataset
head(mtcars)