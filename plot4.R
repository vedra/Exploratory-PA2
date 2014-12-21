NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

SCC_coal <- SCC[grep("[Cc]oal", SCC$EI.Sector),]
NEI_coal <- merge(NEI,SCC_coal, by = "SCC")
NEI_coal_agg <- aggregate(Emissions~year,NEI_coal,sum)
g <- ggplot(NEI_coal_agg, aes(year,Emissions))

png(file = "plot4.png", width = 480, height = 480)

g + geom_bar(stat = "identity", alpha = 0.4, fill="green") + 
      labs(title = "US Total PM2.5 Emissions from Coal Combustion", x = "Year", y = "Total Emissions (in tons)")

dev.off()
