library(ggplot2)
library(reshape2)

#loading datasets
dataset<-read.csv("summer-products2.csv")
table_size<-read.csv("table_size.csv")
dataset2<-read.csv("to_heatmap.csv")
prices<-read.csv("prices.csv")

#computing correlation
data2_corr<-round(cor(dataset2),2)

#melting dataset to long format
melt_data2 <- melt(data2_corr)

#Histograms
ggplot(dataset, aes(rating))+
  geom_histogram(aes(y=..density..))+
  geom_density()+
  ggtitle("Rozklad ocen produktow")

ggplot(dataset, aes(rating))+
  geom_histogram(aes(y=..density..), color="skyblue3", fill="skyblue3")+
  geom_density(color="skyblue4")+
  ggtitle("Rozklad ocen produktow")

#Barplot
ggplot(table_size, aes(x=product_variation_size_id, y=index))+
  geom_bar(stat="identity")+
  labs(x="ilosc", y="rozmiar")

#Heatmap
ggplot(melt_data2, aes(x=Var1, y=Var2))+
  geom_tile(aes(fill=value))+
  geom_text(aes(label = value))


ggplot(melt_data2, aes(x=Var1, y=Var2))+
  geom_tile(aes(fill=value))+
  geom_text(aes(label = value))+
  scale_fill_continuous(low = "lightblue", high = "red4")

#Boxplot and violin plot
ggplot(melt(prices), aes(variable, value))+
  geom_boxplot()+
  ggtitle("Ceny produktow w EUR")

ggplot(melt(prices), aes(variable, value, fill=variable))+
  geom_violin()+
  ggtitle("Ceny produktow w EUR")


#Tuned histogram
ggplot(dataset, aes(rating))+
  geom_histogram(color="blue3", aes(fill=..count..), alpha = .8)+
  labs(x="ocena", y="ilosc")+
  scale_fill_continuous(name="Liczba ocen")+
  ggtitle("Rozklad ocen produktow")+
  theme_bw()

