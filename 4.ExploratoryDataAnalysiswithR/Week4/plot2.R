#Load packages

library(tidyverse)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/summarySCC_PM25.rds")
SCC <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/Source_Classification_Code.rds")

##Calculate the total emmissions by year (we make a sum of the emissions) and we filter Baltimore City
NEI_Baltimore <-
  NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(total_emission =
                                                                     sum(Emissions))

#PLOT
png(filename="plot2.png", width=480, height=480, units="px") #Set png graphic device
plot(NEI_Baltimore$year, NEI_Baltimore$total_emission, xlab = "Year", ylab = "Total emissions (tons)", main="Total Emissions of PM2.5 (in tons) \nper year in Baltimore City", xaxt="n", type="l")
points(NEI_Baltimore$year, NEI_Baltimore$total_emission, col="darkorange", pch=19)
axis(1, at=c(1999, 2002, 2005, 2008))
dev.off() #Stop using the png device
