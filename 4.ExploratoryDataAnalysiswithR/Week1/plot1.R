#Load packages

library(tidyverse)

#Load data

data <-
  read.table(
    "4.ExploratoryDataAnalysiswithR/Week1/household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    na.strings="?",
    colClasses = c(rep("character", 2), rep("numeric", 7)) #Makes first two columns character and the remaning 7, numeric
  )

#Transform date variable

data[,"Date"] <- as.Date(data[,"Date"], format = "%d/%m/%Y")


data <- data %>% filter(Date<=as.Date("2007-02-02"), Date>=as.Date("2007-02-01")) #Filter dates


#Histogram

png(filename="plot1.png", width=480, height=480, units="px") #Set png graphic device
hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)") #Save plot to png
dev.off() #Stop using the png device



