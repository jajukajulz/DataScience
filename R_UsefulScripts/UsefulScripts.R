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

#return number of columns/features in dataset
length(mtcars) #expect this to be 11

#return column names from dataset
names(mtcars)
#colnames(mtcars)

#check number of observations/cases/rows and features/variables/columns in dataset
dim(mtcars) #this should return 32 observations and 11 features

#check dataset column types
sapply(mtcars, class)

#check dataset column types and get more info
str(mtcars) #Returns column types and more info such as the levels of your factors and the first few values of each variable)

#convert a dataset column to factor/category variable (i.e. so R does not confuse the feature with numerical variables)
mtcars[,9] <- factor(mtcars[,9]) #convert column 9 which is transmission type manual or automatic
mtcars$am <- factor(mtcars$am) #alternative to above

#for loop
for(i in 1:length(mtcars)){
    cat("Iteration number = ", i)
    #If you want the entire output returned as a string use sprintf or paste
    #mystring <- sprintf("Iteration number = ", i)
}

#read csv
USBabyNames <- read.csv("USBabyNames.csv")

