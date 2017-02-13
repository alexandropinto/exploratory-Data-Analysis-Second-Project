setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 4/evaluation")

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### Select Baltimore City's date
sub1<-subset(NEI, NEI$fips=="24510" | NEI$fips=="06037")

### Selecting the motor vehicle sounce in Baltimore and Los Angesls Cities' Data
SCC.MV<-SCC[grep("[Vv]ehicle",SCC$SCC.Level.Two),]
NEI.MV.BL<-sub1[sub1$SCC %in% SCC.MV$SCC,]

gr3 <- aggregate(NEI.MV.BL[c("Emissions")],list(fips=NEI.MV.BL$fips, year = NEI.MV.BL$year), sum)
gr3$City<-as.character(0)
gr3[gr3$fips=="06037",]$City<-"Los Angeles"
gr3[gr3$fips=="24510",]$City<-"Baltimore"

### Building the graphic
png("plot6.png",width=540,height=480,units="px",bg="transparent")

g6<-ggplot(gr3, aes(x=gr3$year,y=gr3$Emissions, color=City))
g6+geom_line()+labs(x="Year", y=expression("Emissions PM"[2.5]*"(tons)")) + ggtitle(expression("Motor Vehicles Related Emissions PM"[2.5]*" in Baltimore and Los Angels, 1999-2008"))
dev.off()
