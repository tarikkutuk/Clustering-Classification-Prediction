library(PerformanceAnalytics)
library(readxl)
library(dplyr)
library(stringr)
library(ggplot2)
library(tidyverse)
library(corrplot)
library(matlib)
library(funModeling)
library(openxlsx)
library(stringr)
library(DescTools)
library(dendextend) 
library(haven)
library(factoextra)
library(cluster)
library(plotly)
library(haven)
library(dendextend)
library(GGally)
library(superml)

data <- read_excel("C:/Users/tarik/Desktop/okul/tez2/MY2022 Fuel Consumption Ratings.xlsx")

data<-as.data.frame(data)

data$Make<-as.factor(data$Make)
data$`Vehicle Class`<-as.factor(data$`Vehicle Class`)
data$Transmission<-as.factor(data$Transmission)
data$`Fuel Type`<-as.factor(data$`Fuel Type`)

data$TransmissionType<-str_extract(data$Transmission, "[A-Z]+")
data$TransmissionType<-as.factor(data$TransmissionType)
data<-data[,-1]
summary(data)

freq(data)

two_seater<-which(data$`Vehicle Class`=="Two-seater")
data<-data[-two_seater,]

diesel<-which(data$`Fuel Type`=="D")
data<-data[-diesel,]
electric<-which(data$`Fuel Type`=="E")
data<-data[-electric,]
data2<-data
freq(data)
summary(data)

data<-data %>% tibble::rownames_to_column(var = "index2")
data<-data[,-1]


ggplot(data,aes(data$`Fuel Consumption (City (L/100 km)`))+
  labs(title="Şehir içi yakıt tüketimi")+
  geom_histogram(fill="steelblue",colour="black", alpha=0.6)

ggplot(data, aes(y=data$`Fuel Consumption (City (L/100 km)`, x=factor(data$`Fuel Type`),fill=data$`Fuel Type`))+
  geom_boxplot()+
  labs(title = "Yakıt tipine göre şehir içi yakıt tüketimi", x="Yakıt tipi", y="Şehir içi yakıt tüketimi")

ggplot(data,aes(data$`Fuel Consumption(Hwy (L/100 km))`))+
  labs(title="Şehir dışı yakıt tüketimi")+
  geom_histogram(fill="steelblue",colour="black", alpha=0.6)

ggplot(data, aes(y=data$`Fuel Consumption(Hwy (L/100 km))`, x=factor(data$`Fuel Type`),fill=data$`Fuel Type`))+
  geom_boxplot()+
  labs(title = "Yakıt tipine göre şehir dışı yakıt tüketimi", x="Yakıt tipi", y="Şehir içi yakıt tüketimi")

scatter1<-ggplot(data, aes(data$`Fuel Consumption (City (L/100 km)`,data$`Fuel Consumption(Hwy (L/100 km))`, color=data$`Fuel Type`))+
  geom_point(size=1,alpha=0.8)+
  geom_smooth(method = "loess", col="red",se = FALSE)+
  labs(title = "Şehir içi ve şehir dışı yakıt tüketimi saçılım grafiği", x="şehir içi", y="şehir dışı")
ggplotly(scatter1)

ggplot(data,aes(data$`Fuel Consumption(Comb (L/100 km))`))+
  labs(title="Ortalama yakıt tüketimi")+
  geom_histogram(fill="steelblue",colour="black", alpha=0.6)

ggplot(data, aes(y=data$`Fuel Consumption(Comb (L/100 km))`, x=factor(data$`Fuel Type`),fill=data$`Fuel Type`))+
  geom_boxplot()+
  labs(title = "Yakıt tipine göre ortalama yakıt tüketimi", x="Yakıt tipi", y="Ortalama yakıt tüketimi")

ggplot(data, aes(y=data$`Fuel Consumption(Comb (L/100 km))`, x=factor(data$TransmissionType),fill=data$TransmissionType))+
  geom_boxplot()+
  labs(title = "Şanzıman tipine göre ortalama yakıt tüketimi", x="Şanzıman tipi", y="Ortalama yakıt tüketimi")


data<-data %>% tibble::rownames_to_column(var = "index2")
data<-data[,-1]
data[736,]
data<-data[-736,]

#korelasyon
quantitatives<-data[,c(4,5,8,9,10,11,12,13)]
quantitatives<-as.data.frame(quantitatives)
colnames(quantitatives)[3]<-"Fuel_cons_city"
colnames(quantitatives)[4]<-"Fuel_cons_hwy"
colnames(quantitatives)[5]<-"Fuel_cons_comb_L"
colnames(quantitatives)[6]<-"Fuel_cons_comb_mpg"

corr_quan<-corrplot(cor(quantitatives, method = "spearman"), method="number")
inv_corr_quan<-inv(corr_quan$corr)
inv_corr_quan

