#title: "Collection of useful (and unrelated) R code snippets"
#author: "Julian Kanjere"
#date: "August 2019"

#Remove all the objects from the workspace
rm(list=ls())

#Set working directory to path of currently open script
library(rstudioapi) #You can't use this package unless you are in an interactive RStudio session
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

#Print to console and add newline
cat('I need to move on to a new line', '\n', 'at here')

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

#Create a dataframe and add custom row names
my_df <- cbind(col1=c(1,2,3,4))
rownames(my_df) <- c("a","b","c","d")

#Sort a dataframe in DESC order
my_df[with(my_df, order(-col1)), ]

#Create an empty dataset and assign column names
    my_df <- data.frame(matrix(ncol = 3, nrow = 0))
    my_df_colnames <- c("name", "surname", "phone number")
    colnames(my_df) <- my_df_colnames

#Creating a table from a dataset
library(knitr)
kable(head(my_df, caption = "My Custom Table"), format = "markdown", digits = 2)

#Merge dataframes / Add new columns
df <- data.frame(Name = "John",Surname = "Doe")
de <- data.frame(Country = "South Africa", City = "Cape Town")
merge(df,de) #adds to the same row as new columns

#Creating a pie chart
holdings <- c(50, 24, 20, 6)
holdings_labels <- c("Bitcoin", "Ethereum", "ZCash", "XRP")
holdings_percent <- round(holdings/sum(holdings)*100) #calculate the percentages
holdings_percent_labels <- paste(holdings_labels, holdings_percent) #concatenate labels with percentages
holdings_percent_labels <- paste(holdings_percent_labels,"%",sep="") #concatenate labelled percentages with % symbol
pie(holdings, labels = holdings_percent_labels, 
    col=rainbow(length(holdings_percent_labels)),
    main="Crypto Holdings Pie Chart")

#create a new column from combination of two different columns
#e.g. iris dataset, combine Species and Width
iris_Species <- iris$Species #e.g. setosa
iris_Petal_Width <- iris$Petal.Width #e.g. 0.2
iris_Species_Width_Col <- paste(iris_Species, iris_Petal_Width) #e.g. "setosa 0.2"

#barplot with rainbow colours and varying y axis limits
tN <- table(Ni <- stats::rpois(100, lambda = 5))
barplot(tN, col = rainbow(20), ylim = c(0,50), main = 'long y-axis')
barplot(tN, col = rainbow(20), main = 'short y axis')

# automatically adjusted y-axisusing pretty() which returns a list of interval breaks covering all values of the provided data. 
#pretty() guarantees that the maximum returned value is a round number and greater than maximum value in the data.
barplot(tN, col = rainbow(20), ylim = range(pretty(c(min(tN), max(tN)))), main = 'long y-axis overing all values')

#remove zero variance column
data("iris")
str(iris)
iris$ZeroVariance <- 10 #add a column with zero variance
head(iris)
summary(iris)
apply(iris, 2, var) #calculate variance for the different columns
zero_variance_columns <- which(apply(iris, 2, var) == 0) #find column number of variables with zero variance
iris <- iris[ - as.numeric(zero_variance_columns)] #exclude zero variance columns
str(iris)