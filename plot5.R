NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_motor <- subset(NEI_Baltimore, type == "ON-ROAD")
NEI_Baltimore_motor_agg <- aggregate(Emissions~year,NEI_Baltimore_motor,sum)

png(file = "plot5.png", width = 480, height = 480)
g <- ggplot(NEI_Baltimore_motor_agg, aes(year,Emissions))
g + geom_bar(stat = "identity", alpha = 0.4, fill="green") + 
      labs(title = "Baltimore Total PM2.5 Emissions from Motor Vehicle Sources", x = "Year", y = "Total Emissions (in tons)")
dev.off()