#Load packages

library(tidyverse)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/summarySCC_PM25.rds")
SCC <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/Source_Classification_Code.rds")

##Calculate the total emmissions by year (we make a sum of the emissions)
NEI_tot <- NEI %>% group_by(year) %>% summarise(total_emission=sum(Emissions))

#PLOT
png(filename="plot1.png", width=480, height=480, units="px") #Set png graphic device
plot(NEI_tot$year, NEI_tot$total_emission, xlab = "Year", ylab = "Total emissions (tons)", main="Total Emissions of PM2.5 (in tons) \nper year in the United States", xaxt="n", type="l")
points(NEI_tot$year, NEI_tot$total_emission, col="red", pch=19)
axis(1, at=c(1999, 2002, 2005, 2008))
dev.off() #Stop using the png device
