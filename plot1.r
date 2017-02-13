
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 4/evaluation")

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate all PM2.5 by year

gr1<-with(NEI, tapply(Emissions, year, sum, na.rm=T))

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(gr1/10^3,xlab="Year",ylab=expression("Total Annual Emissions PM"[2.5]*"/1000 Tons"), main = expression("Total Annual Emissions PM"[2.5]*""))

dev.off()

