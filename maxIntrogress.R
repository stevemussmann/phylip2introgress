#!/usr/bin/Rscript

library(introgress)


gen.data.sim <- read.csv(file="admix.csv", header=FALSE)

loci.data.sim <- read.csv(file="loci.txt", header=TRUE)

p1.data <- read.csv(file="p1data.csv", header=FALSE)

p2.data <- read.csv(file="p2data.csv", header=FALSE)

count.matrix <- prepare.data(admix.gen=gen.data.sim, loci.data=loci.data.sim, parental1=p1.data, parental2=p2.data)

hi.index.sim <- est.h(introgress.data=count.matrix, loci.data=loci.data.sim)

hi.index.sim

int.het <- calc.intersp.het(introgress.dat=count.matrix)

triangle.plot(hi.index=hi.index.sim, int.het=int.het, pdf=TRUE)
