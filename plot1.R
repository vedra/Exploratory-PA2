NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_agg <- aggregate(Emissions~year, data = NEI, sum)
x <- NEI_agg$Emissions
names(x) <- NEI_agg$year

png(file = "plot1.png", width = 480, height = 480)
barplot(x/1e6,xlab = "Year", ylab = "Total Emissions (in millions of tons)", main = "US Total PM2.5 Emissions - All Sources")
dev.off()