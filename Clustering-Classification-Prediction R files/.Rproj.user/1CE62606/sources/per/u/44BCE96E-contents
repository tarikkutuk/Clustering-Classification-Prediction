#karar ağacı
data3<-data[,-c(6,8,9,11,16)]
colnames(data3)= c("Make","Model","VehicleClass","EngineSize","Cylinders","FuelType","FuelConsComp","CO2Emission","CO2Rating","SmogRating","TransmissionType")

set.seed(17051999)
trainIndex<-sample(1:nrow(data3),size = round(0.7*nrow(data3)), replace = FALSE)
train_data<-data3[trainIndex,]
test_data<-data3[-trainIndex,]


#model1:
tree<-rpart(TransmissionType ~ VehicleClass + EngineSize+ Cylinders+ FuelType+ FuelConsComp+ CO2Emission+ CO2Rating+ SmogRating, data = train_data, method = "class")
rpart.plot(tree)
summary(tree)
printcp(tree)
plotcp(tree)

predict(tree, test_data, method="class")

confmat_TT<-table(predict(tree, test_data, type ="class"), test_data$TransmissionType)

confusionMatrix(confmat_TT)

forpng<-fancyRpartPlot(tree, main = "Fuel type tree")


#model2:

tree2<-rpart( FuelType~ VehicleClass+ EngineSize+ Cylinders+ FuelConsComp+ CO2Emission+ CO2Rating+ SmogRating+ TransmissionType, data = train_data, method = "class")
rpart.plot(tree2)
printcp(tree2)
plotcp(tree2)
fancyRpartPlot(tree2, type = 4)

confmat_FT<-table(predict(tree2, test_data, type = "class"), test_data$FuelType)
confmat_FT<-confmat_FT[-c(1,2),-c(1,2)]
confusionMatrix(confmat_FT)


#prune2
pruned_tree2<-prune(tree2, cp=0.016)
rpart.plot(pruned_tree2)
printcp(pruned_tree2)

confmat_FT_P<-table(predict(pruned_tree2, test_data, type = "class"), test_data$FuelType)
confmat_FT_P<-confmat_FT_P[-c(1,2),-c(1,2)]
confusionMatrix(confmat_FT_P)


#prune2.1
tree2_preprun<-rpart( FuelType~ VehicleClass+ EngineSize+ Cylinders+ FuelConsComp+ CO2Emission+ CO2Rating+ SmogRating+ TransmissionType,
                             data = train_data, method = "class",
                             control = rpart.control(cp=0, maxdepth = 9, minsplit = 21))

printcp(tree2_preprun)
fancyRpartPlot(tree2_preprun, type = 2)
rpart.plot(tree2_preprun)
confmat_FT_Pre<-table(predict(tree2_preprun, test_data, type = "class"), test_data$FuelType)
confmat_FT_Pre<-confmat_FT_Pre[-c(1,2),-c(1,2)]
confusionMatrix(confmat_FT_Pre)



#model3
tree3<-rpart( FuelConsComp~ VehicleClass +EngineSize+ Cylinders+ FuelType+ TransmissionType, data = train_data,
              control = rpart.control(cp=0, maxdepth = 9, minsplit = 15))
fancyRpartPlot(tree3, type = 2, tweak=3, main = "Fuel Cons Comp Tree")
defaultSummary(data.frame(obs=test_data$FuelConsComp, pred=round(predict(tree3,test_data),0)))
printcp(tree3)
