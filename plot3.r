setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 4/evaluation")
library(ggplot2)

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Select Baltimore's Data
sub1<-subset(NEI, NEI$fips=="24510" )
gr3 <- aggregate(sub1[c("Emissions")],list(Type=sub1$type, year = sub1$year), sum)

### Build the graph
png("plot3.png",width=480,height=480,units="px",bg="transparent")
g3<-ggplot(gr3)
g+geom_line()+labs(x="Year", y=expression("Emissions PM"[2.5]*"")) + ggtitle(expression("Total PM"[2.5]* "Emissions in Baltimore per Type 1999-2008"))
dev.off()