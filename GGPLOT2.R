library(data.table)
library(ggplot2)

Pitilla <- fread("Pitilla_Data.csv")
Pitilla
# Plot of Number of Intact Berries versus Leaf Index
ggplot(data=Pitilla, aes(x=Intact_berries, y=Leaf_Index)) +
  geom_point(stat="identity", color = "red")

#Testing for correlation between Leaf Index and the Number of Intact Berries
var1 <- Pitilla$Intact_berries
var2 <- Pitilla$Leaf_Index
cor.test(var1, var2)   # Correlation is not significant

# Plot of Number of Berries versus Height
ggplot(data=Pitilla, aes(x=Intact_berries, y=Height)) +
  geom_point(stat="identity", color = "red")


#Testing for Correlation between Number of Intact Berries and Height
var4 <- Pitilla$Height
cor.test(var1,var4)    # Correlation is significant

