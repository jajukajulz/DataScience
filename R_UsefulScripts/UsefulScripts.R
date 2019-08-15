#title: "Collection of useful (and unrelated) R code snippets"
#author: "Julian Kanjere"
#date: "August 2019"

#Remove all the objects from the workspace
rm(list=ls())

#Set working directory to path of currently open script
library(rstudioapi)
current_path = rstudioapi::getActiveDocumentContext()$path  #Get path of current open file
setwd(dirname(current_path ))#setworking directory
print( getwd() )

#Set seed so that sampling can be reproduced in future
set.seed(10)

#80%/20% Train Test Split
train = sample(1:nrow(mtcars), nrow(mtcars)*.80)
mtcars.test = mtcars[-train,]
mtcars.train = mtcars[train,]

#View first 6 rows and all columns (features) of dataset
head(mtcars)

#Return number of columns/features in dataset
length(mtcars) #expect this to be 11

#Return column names from dataset
names(mtcars)
#colnames(mtcars)

#Check number of observations/cases/rows and features/variables/columns in dataset
dim(mtcars) #this should return 32 observations and 11 features

#Check dataset column types
sapply(mtcars, class)

#Check dataset column types and get more info
str(mtcars) #Returns column types and more info such as the levels of your factors and the first few values of each variable)

#Convert a dataset column to factor/category variable (i.e. so R does not confuse the feature with numerical variables)
mtcars[,9] <- factor(mtcars[,9]) #convert column 9 which is transmission type manual or automatic
mtcars$am <- factor(mtcars$am) #alternative to above

#Return Summary for each column - Min, 1st Quartile, Median, Mean, 3rd Quartile, Max
summary(mtcars)

#Check frequencies of factor variable (assumes variable mtcars$am has been converted to a factor)
table(mtcars$am)

#To plot a "scatter plot" of a single dimensional variable in R i.e. a number line
library(ggplot2)
ggplot(mtcars, aes(x=mtcars$VariableName, y=c(0))) + geom_point()

#For loop
for(i in 1:length(mtcars)){
    cat("Iteration number = ", i)
    #If you want the entire output returned as a string use sprintf or paste
    #mystring <- sprintf("Iteration number = ", i)
}

#Read csv
USBabyNames <- read.csv("USBabyNames.csv")

#Drop ID variable if in dataset
USBabyNames <- USBabyNames[,-1] #Drop ID variable which is first column

#Check for missing values (NA or NaN)
colSums(is.na(USBabyNames))

#Retain only complete cases
USBabyNames <- USBabyNames[complete.cases(USBabyNames),]


#Remove rows with NA or NaN in Count column from the dataset (Generally not a good approach although useful in some cases)
USBabyNames <- USBabyNames[!is.na(USBabyNames$Count),]
#USBabyNames <- na.omit(USBabyNames) #alternative to excluding missing values

#Update missing values for Count using median values
summary(USBabyNames)
Count.median <- median(USBabyNames$Count, na.rm=TRUE) #calculate median excluding missing values
USBabyNames$Count[is.na(USBabyNames$Count)] <- Count.median


#Count number of observations whose column matches a specific value
sum(mtcars$gear == 4) #number of cars with 4 gears
