#KÜMELEME
data<-data %>% tibble::rownames_to_column(var = "index")
#hiyerarşik

kumeleme<-data2[,c(3,4,7,10,13,15)]
kumeleme<-as.data.frame(kumeleme)
distances<-dist(kumeleme, method = "euclidean")
fit<- hclust(distances, method = "ward.D")
dend<-as.dendrogram(fit)
plot(color_branches(dend, k=4))

glimpse(kumeleme)
colSums(is.na(kumeleme))
#K_Means

fviz_nbclust(kumeleme, kmeans, method = "wss")

set.seed(170599)
km_result <- kmeans(kumeleme,4, iter.max=20, algorithm="Lloyd")
result_centers<-as.data.frame(t(km_result$centers))
result_centers

data2$clusters<-km_result$cluster
data2$clusters<-as.factor(data2$clusters)
freq(data2$clusters)

kumeleme$clusters<-km_result$cluster
kumeleme$clusters<-as.factor(kumeleme$clusters)

cluster1<-which(kumeleme$clusters==1)
cluster2<-which(kumeleme$clusters==2)
cluster3<-which(kumeleme$clusters==3)
cluster4<-which(kumeleme$clusters==4)

cluster11<-kumeleme[cluster1,]
cluster22<-kumeleme[cluster2,]
cluster33<-kumeleme[cluster3,]
cluster44<-kumeleme[cluster4,]

freq(cluster11[,c(1,6)])
freq(cluster22[,c(1,6)])
freq(cluster33[,c(1,6)])
freq(cluster44[,c(1,6)])
