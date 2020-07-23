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

#Paste date and hour values
data$time_ensayo <- paste(data$Date, data$Time, sep=" ")

data$time_ensayo2 <-
  strptime(data$time_ensayo, format = "%d/%m/%Y %H:%M:%S") #Create time variable

data[,"Date"] <- as.Date(data[,"Date"], format = "%d/%m/%Y")

data <- data %>% filter(Date<=as.Date("2007-02-02"), Date>=as.Date("2007-02-01")) #Filter dates


png(filename="plot2.png", width=480, height=480, units="px") #Set png graphic device
plot(data$time_ensayo2, data$Global_active_power, type="l", main = 'Global active power', xlab = '', ylab = 'Global active power (kilowatts)') #Save plot to png
dev.off() #Stop using the png device

