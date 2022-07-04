#encoding

data2<-data

lbl = LabelEncoder$new()
data2$`Vehicle Class`=lbl$fit_transform(data2$`Vehicle Class`)
data2$Transmission=lbl$fit_transform(data2$Transmission)
data2$TransmissionType=lbl$fit_transform(data2$TransmissionType)

encode_ordinal <- function(x, order = unique(x)) {
  x <- as.numeric(factor(x, levels = order, exclude = NULL))
  x
}
data2$`Fuel Type`<-encode_ordinal(data2$`Fuel Type`)


data2$TransmissionType<-as.factor(data2$TransmissionType)
data2$`Vehicle Class`<-as.factor(data2$`Vehicle Class`)
data2$TransmissionType<-as.factor(data2$TransmissionType)
data2$`Fuel Type`<-as.factor(data2$`Fuel Type`)

