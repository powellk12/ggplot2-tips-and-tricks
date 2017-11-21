library(data.table)
library(ggplot2)

#  Rainfall_Data_Daily <- fread("Rainfall_Data.csv")
Rainfall_Monthly <- fread("Rainfall.csv")
Rainfall_Monthly

ggplot(data=Rainfall_Data, aes(x=Month, y=ECR))+
  geom_point(stat="identity")

Test <- as.Date(Rainfall_Monthly$Month, "%b-%y")
Test
