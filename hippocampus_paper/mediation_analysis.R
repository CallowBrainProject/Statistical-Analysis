#!/usr/bin/env Rscript  

#install.packages("readxl")
#install.packages("mediation")
#install.packages("psych")

#load readxl
library("readxl")

library("mediation") #Mediation package

library("psych")

getwd()
#set working directory
setwd('/Users/amos/Documents/')

#read in xlsx files
diffusion_data = read_excel("AES_diffusion_stats.xlsx", sheet = "mediation")

#create data frame with diffusion data
diffusion_data = data.frame(diffusion_data)

#Perform Mediation analysis with A=mediate(y~x+mediator, data=diffusion_data)
A=mediate(positive_diff~hipp_diff+(MD_SpleniumCC), data=diffusion_data)
#summarise mediation analysis
A
#summarise each individual relationship
summary(A,short=FALSE)
