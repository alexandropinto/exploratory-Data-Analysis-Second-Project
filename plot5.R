
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 4/evaluation")

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### Select Baltimore City's date
sub1<-subset(NEI, NEI$fips=="24510")

### Selecting the motor vehicle sounce in Baltimore City's Data
SCC.MV<-SCC[grep("[Vv]ehicle",SCC$SCC.Level.Two),]
NEI.MV.BC<-sub1[sub1$SCC %in% SCC.MV$SCC,]
gr3 <- aggregate(NEI.MV.BC[c("Emissions")],list(year = NEI.MV.BC$year), sum)

### Building the graphic
png("plot5.png",width=480,height=480,units="px",bg="transparent")
g5<-ggplot(gr3, aes(x=gr3$year,y=gr3$Emissions))
g5+geom_line()+labs(x="Year", y=expression("Emissions PM"[2.5]*"(tons)")) + ggtitle(expression("Motor Vehicles Related Emissions PM"[2.5]*" in Baltimore"))
dev.off()

)dev.off()