
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 4/evaluation")

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sub1<-subset(NEI, NEI$fips=="24510")

gr2<-with(sub1, tapply(Emissions, year, sum, na.rm=T))

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(gr2/10^3,xlab="Year",ylab=expression("Total Annual Emissions PM"[2.5]*"/1000 Tons"), main = expression("Total Annual Emissions PM"[2.5]*"in Baltimore City, Maryland"))

dev.off()
