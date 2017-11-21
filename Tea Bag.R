library(plyr)
library(dplyr);library(car);library(sciplot);library(tidyr)
library(ggplot2)
library(cowplot)

df1<-read.csv("/Users/KaraPowell/Downloads/KaraTBI.csv",header=T)
names(df1)
df1$MRgreen<-1-df1$Fraction.decomposed.green.tea..ag.
df1$MRred<-df1$Fraction.remaining......rooibos.tea..Wt.
df2<-subset(select(df1,Treatment,MRgreen, MRred, Plot.ID),Treatment!='fence')
df2
#because some plots only have one value:
df3<-ddply(df2,c('Treatment','Plot.ID'),summarise,MRgreen=mean(MRgreen,na.rm=T),MRred=mean(MRred,na.rm=T))
df3
df4<-gather(df3,Type,MR,-Plot.ID,-Treatment)


lineplot.CI(Treatment,MR,Type,data=df4)
ggdf4<-ddply(df4,c('Treatment','Type'),summarise,MassRemain=mean(MR,na.rm=T),sd=sd(MR,na.rm=T),N=sum(!is.na(MR)),se=sd/sqrt(N))
ggplot(data=subset(ggdf4,MassRemain>0),aes(x=Treatment,y=MassRemain,col=Type))+geom_point(size=3)+theme_cowplot()+geom_errorbar(aes(ymin=MassRemain-se,ymax=MassRemain+se,width=0.2))+scale_color_manual(values=c('darkgreen','brown4'),breaks=c('MRgreen','MRred'),labels=c('Green','Rooibos'),name='Tea Type')+labs(y='Mass Remaning (%)')
aggregate(MR~Type,FUN=mean,data=df4)

m1<-lm(MR~Treatment*Type,data=df4)
Anova(m1,type=2)
 #Green lost 1.73 times more mass than rooibos