#!/usr/bin/Rscript

## We assume that introgress and additional packages have been installed from CRAN

## load the introgress library 
library(introgress)

## set the working directory in R to an existing directory where you will work
## and where the downloaded data files have been saved
## On Mac OS and other UNIX systems:
##     setwd("~/Documents/introgress/")
## On Windows ... replace your_username with appropriate name:
##     setwd("C:/Documents and Settings/your_username/Documents/introgress")

## read in data for individuals from admixed population
gen.data.sim <- read.csv(file="admix.csv", header=FALSE)

## read in marker information
loci.data.sim <- read.csv(file="loci.txt", header=TRUE)

## read in parental data sets
p1.data <- read.csv(file="p1data.csv", header=FALSE)
p2.data <- read.csv(file="p2data.csv", header=FALSE)

## look at help page that describes the data set
help(AdmixDataSim2)

## code to convert genotype data into a matrix of allele counts,
## the results are saved to the list data object count.matrix
count.matrix <- prepare.data(admix.gen=gen.data.sim, loci.data=loci.data.sim, parental1=p1.data, parental2=p2.data)

## estimate hybrid index values and save the results to the
## data.frame data object hi.index.sim1
hi.index.sim <- est.h(introgress.data=count.matrix, loci.data=loci.data.sim)

## make plot to visualize patterns of introgression
## this saves the plot to a pdf in the current directory for R
mk.image(introgress.data=count.matrix, loci.data=loci.data.sim, hi.index=hi.index.sim, ylab.image="Individuals", xlab.h="population 2 ancestry", pdf=FALSE)
