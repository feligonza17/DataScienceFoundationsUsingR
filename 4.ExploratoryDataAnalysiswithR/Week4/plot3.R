#Load packages

library(tidyverse)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/summarySCC_PM25.rds")
SCC <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/Source_Classification_Code.rds")

##Calculate the total emmissions by year (we make a sum of the emissions) and we filter Baltimore City
NEI_Baltimore <-
  NEI %>% filter(fips == "24510") %>% group_by(year, type) %>% summarise(total_emission =
                                                                     sum(Emissions))


#PLOT

png(filename="plot3.png", width=480, height=480, units="px") #Set png graphic device
NEI_Baltimore %>% 
  ggplot(aes(x=year, y=total_emission, col=type))+
  geom_line()+
  geom_point()+
  ylab("Total Emissions of PM2.5 (in tons)")+
  ggtitle(" Total Emissions of PM2.5 (in tons) per type in Baltimore City")+
  scale_x_discrete(name ="Year", 
                   limits=c(1999,2002,2005, 2008))+
  theme_bw()
dev.off() #Stop using the png device
