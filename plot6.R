NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_motor <- subset(NEI_Baltimore, type == "ON-ROAD")
NEI_Baltimore_motor_agg <- aggregate(Emissions~year,NEI_Baltimore_motor,sum)

NEI_LA <- subset(NEI, fips == "06037")
NEI_LA_motor <- subset(NEI_LA, type == "ON-ROAD")
NEI_LA_motor_agg <- aggregate(Emissions~year,NEI_LA_motor,sum)

NEI2 <- rbind(NEI_Baltimore_motor_agg, NEI_LA_motor_agg)
NEI2$city <- c(rep('Baltimore',4),rep("Los Angeles",4))
NEI2$year = as.character(NEI2$year)

png(file = "plot6.png", width = 480, height = 480)
g <- ggplot(NEI2, aes(year,Emissions))
g + geom_bar(stat = "identity", alpha = 0.4, aes(color = city, fill = city), position = "dodge")  + 
      labs(title = "Baltimore vs. LA: Total PM2.5 Emissions from Motor Vehicles", x = "Year", y = "Total Emissions (in tons)")
dev.off()