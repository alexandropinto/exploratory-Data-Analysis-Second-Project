setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 4/evaluation")
library(ggplot2)

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Select SCC and NEI Coal
SCC.Cooal<-SCC[grep("[Cc]oal",SCC$Short.Name),]
NEI.Coal<-subset(NEI,NEI$SCC %in% SCC.Coal$SCC)
gr3 <- aggregate(NEI.Coal[c("Emissions")],list(year = NEI.Coal$year), sum)

### Build the graph

png("plot4.png",width=480,height=480,units="px",bg="transparent")
g4<-ggplot(gr3, aes(x=gr3$year,y=gr3$Emissions))
g4+geom_line()+labs(x="Year", y=expression("Emissions PM"[2.5]*"")) + ggtitle(expression("Total PM"[2.5]* " Coal Emissions in USA, 1999-2008"))
dev.off()