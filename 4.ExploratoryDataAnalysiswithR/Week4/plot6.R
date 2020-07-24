#Load packages

library(tidyverse)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/summarySCC_PM25.rds")
SCC <- readRDS("4.ExploratoryDataAnalysiswithR/Week4/Source_Classification_Code.rds")

#Select coal emmissions from SCC data set
SCC_filter <- SCC %>%filter(grepl("Vehicles", EI.Sector))   #We extract the values that have "Vehicles" in this variable
SCC_filter$SCC <- as.character(SCC_filter$SCC) #We transform to character to be able to match these values with the NEI data set

NEI_filt <-
  NEI %>% filter(SCC %in% SCC_filter$SCC) %>% filter(fips == "24510" |
                                                       fips == "06037") #We filter the SCC rows that match the SCC that have been just extracted that contain vehicles (it matches the SCC of NEI data set with the one created earlier). Also  filter Baltimore city and los Angeles County

NEI_final <- NEI_filt %>% mutate(City=ifelse(fips=="24510", "Baltimore City", "Los Angeles County")) #Create New variable that distinguishes each city

NEI_tot <- NEI_final %>% group_by(year, City) %>% summarise(total_emission=sum(Emissions)) #Total emissions of vehicle emmissions


#PLOT
png(filename="plot6.png", width=480, height=480, units="px") #Set png graphic device
NEI_tot %>% 
  ggplot(aes(x=year, y=total_emission, col=City))+
  geom_line()+
  geom_point()+
  ylab("Total Emissions of PM2.5 (in tons)")+
  ggtitle("Total Emissions of PM2.5 (in tons) of vehicle sources \nper year")+
  scale_x_discrete(name ="Year", 
                   limits=c(1999,2002,2005, 2008))+
  theme_bw()
dev.off() #Stop using the png device
