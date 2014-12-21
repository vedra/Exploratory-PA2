NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file = "plot2.png", width = 480, height = 480)

NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_agg <- aggregate(Emissions~year,NEI_Baltimore,sum)
x <- NEI_Baltimore_agg$Emissions
names(x) <- NEI_agg$year
barplot(x,xlab = "Year", ylab = "Total Emissions (in tons)", main = "Baltimore Total PM2.5 Emissions - All Sources")

dev.off()

