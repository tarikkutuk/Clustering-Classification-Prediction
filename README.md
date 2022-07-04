# Clustering-Classification-Prediction
2022'de Kanada'da satışa çıkan araçların bazı özelliklerini içeren bir veri seti ile yaptığım kümeleme, sınıflama ve tahminleme projemdir.

Aynı zamanda Mimar Sinan Güzel Sanatlar Üniversitesi İstatistik Lisans Bölümü bitirme çalışmamdır.

Veri seti kaynağı :https://www.kaggle.com/datasets/rinichristy/2022-fuel-consumption-ratings

Veri setindeki değişkenler:

Model Year: Araçların model yılı

Make: Araçların Markaları

Model: Araçların model isimleri

Vehicle Class: Araçların kasa tipi

Engine Size: Araçların motor hacimleri

Cylinders: Araçların motorlarında kaç silindir olduğu bilgisi

Transmission: Araçların şanzıman tipi ve vites sayısı (bu değişken parçalanarak (transmissiontype isimli yeni bir değişken oluşturulmuştur, bu değişkende araçların yalnızca şanzıman tipi değerleri bulunmaktadır.)

Fuel type: Araçların yakıt tipi: x:hibrit z:benzin e: elektrikli d:dizel

Fuel Consumption (City (L/100 km): Araçların şehir içinde 100 km'de yaktıkları litre cinsinden yakıt miktarı

Fuel Consumption(Hwy (L/100 km)): Araçların şehir dışında 100 km'de yaktıkların litre cinsinden yakıt miktarı

Fuel Consumption(Comb (L/100 km)): Araçların şehir içi ve şehir dışı 100 kmde yaktıkları litre cinsinden yakıt miktarlarının %55 şehir içi ve %45 şehir dışı ağırlıklı 
ortalaması

Fuel Consumption(Comb (mpg)): Araçların 1 galon yakıt ile alabildikleri yol (mil cinsinden)

CO2 Rating: Karbondioksit değerlendirme puanı

Smog Rating: Egzoz gazı değerlendirme puanı

TransmissionType: Araçların şanzıman tipi 
(a: otomatik, m: manuel, av: cvt, as: sıralı(çift kavramalı), am: yarı otomatik)

