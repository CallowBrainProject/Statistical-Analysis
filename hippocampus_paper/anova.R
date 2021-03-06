#!/usr/bin/env Rscript  

#install.packages("readxl")
#install.packages("lsr")
#install.packages("PairedData")
#install.packages("ggplot2")
#load readxl
library("readxl")
library("lsr")
library("PairedData")
library("ggplot2")
getwd()
#set working directory
setwd('/Volumes/DANIEL')

#read in xlsx files
diffusion_data = read_excel("AES_diffusion_stats.xlsx", sheet = "ADC_rhipp")

#create data frame with diffusion data
diffusion_data = data.frame(diffusion_data)

#create column (turn condition into a factorial) and create summary for columns
order=factor(diffusion_data[,7])
condition=factor(diffusion_data[,2])

#perform 2 way anova with order and condition as factors
body_order.aov=aov(diffusion_data$HP_body~order*condition)

#Create anova table
summary(body_order.aov)
