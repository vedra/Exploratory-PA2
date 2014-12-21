NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_Baltimore <- subset(NEI, fips == "24510")

NEI_Baltimore_agg2 <- aggregate(Emissions~year+type,NEI_Baltimore,sum)
NEI_Baltimore_agg2$year <- as.character(NEI_Baltimore_agg2$year)

png(file = "plot3.png", width = 480, height = 480)
g <- ggplot(NEI_Baltimore_agg2, aes(year,Emissions))
g + geom_bar(stat = "identity", alpha = 0.5, aes(color = type, fill=type), position = "dodge") + 
      labs(x = "Year", y = "Total Emissions (in tons)", title = "Baltimore Total PM2.5 Emissions per Different Sources")
dev.off()