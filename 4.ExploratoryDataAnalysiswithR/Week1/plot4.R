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





png(filename="plot4.png", width=480, height=480, units="px") #Set png graphic device

par(mfrow=c(2,2))

# Plot upper left ---------------------------------------------------------

plot(data$time_ensayo2, data$Global_active_power, type="l", xlab = 'datetime', ylab = 'Global active power')

# Plot upper right --------------------------------------------------------

plot(data$time_ensayo2, data$Voltage, type="l", xlab = '', ylab = 'Global active power')

# Plot lower left ---------------------------------------------------------


plot(
  data$time_ensayo2,
  data$Sub_metering_1,
  type = "l",
  col="black",
  xlab = '',
  ylab = 'Energy sub metering'
) #plot number 1

lines(data$time_ensayo2,
      data$Sub_metering_2,
      type = "l",
      col = "red" ) #plot number 2

lines(data$time_ensayo2,
      data$Sub_metering_3,
      type = "l",
      col = "blue" ) #plot number 3

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8, box.lty=0) #Add legend


# Plot lower right --------------------------------------------------------

plot(data$time_ensayo2, data$Global_reactive_power, type="l", xlab = 'datetime', ylab = 'Global_reactive_power')


dev.off() #Stop using the png device


