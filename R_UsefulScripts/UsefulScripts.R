#title: "Collection of useful R code snippets"
#author: "Julian Kanjere"
#date: "August 2019"

#remove all the objects from the workspace
rm(list=ls())

#set working directory to path of currently open script
library(rstudioapi)
current_path = rstudioapi::getActiveDocumentContext()$path  #Get path of current open file
setwd(dirname(current_path ))#setworking directory
print( getwd() )

