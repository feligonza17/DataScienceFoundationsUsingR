#Load packages

library(tidyverse)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/summarySCC_PM25.rds")
SCC <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/Source_Classification_Code.rds")

#Select coal emmissions from SCC data set
SCC_filter <- SCC %>% filter(grepl("Coal", EI.Sector))  #We extract the values that have "coal" in this variable
SCC_filter$SCC <- as.character(SCC_filter$SCC) #We transform to character to be able to match these values with the NEI data set

NEI_filt <- NEI %>% filter(SCC %in% SCC_filter$SCC) #We filter the SCC rows that match the SCC that have been just extracted that contain coal (it matches the SCC of NEI data set with the one created earlier)

NEI_tot <- NEI_filt %>% group_by(year) %>% summarise(total_emission=sum(Emissions)) #Total emissions of coal emmissions

#PLOT
png(filename="plot4.png", width=480, height=480, units="px") #Set png graphic device
plot(NEI_tot$year, NEI_tot$total_emission, xlab = "Year", ylab = "Total emissions (tons)", main="Total Emissions of PM2.5 (in tons)\n of coal combustion-related sources \nper year in the United States", xaxt="n", type="l", col="steelblue3")
points(NEI_tot$year, NEI_tot$total_emission, col="tan3", pch=19)
axis(1, at=c(1999, 2002, 2005, 2008))
dev.off() #Stop using the png device
