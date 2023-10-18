############################
##  Clustering Analysis   ##
##  DoGeun Kwon           ##
##  2023-10-18            ##
############################

setRepositories(ind = 1:7)

library(tidyverse)
library(cluster)
library(factoextra)
library(FactoMineR)
library(dendextend)
library(Nbclust)
library(colorspace)
library(gplots)
library(circlize)

data(USArrests)

Data <- USArrests
Data <- scale(Data)

d <- dist(Data, method = "euclidean")

hc_complete <- hclust(d, method = "complete")
hc_average <- hclust(d, method = "average")
hc_single <- hclust(d, method = "single")

plot(hc_complete, cex = 1, hang = -1)
plot(hc_average, cex = 1, hang = -1)
plot(hc_single, cex = 1, hang = -1)

#hc_complete is better in this data

grp <- cutree(hc_complete, k = 4)
table(grp)


#test <- data.ftame(Data, grp) (old)
test  <- as.data.frame(Data) %>%
  mutate(Cluster = grp)




