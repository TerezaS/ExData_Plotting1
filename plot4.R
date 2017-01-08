## load library data table

library(data.table)

## read data
data <- fread("household_power_consumption.txt", na.strings = "?")

## subset data to have only relevant days
data <- data[Date %in% c("1/2/2007", "2/2/2007"), ]

## convert Date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## create new column DateTime that connects Date and Time in one variable
data <- data[, DateTime := as.POSIXct(paste(data$Date, data$Time))]

## plot the data
# open png device
png(file = "plot4.png", width=480, height=480)
# 2 columns 2 rows of plots
par(mfrow = c(2,2))
# top left plot
plot(data$DateTime
     , data$Global_active_power
     , type = "l"
     , ylab = "Global Active Power"
     , xlab = "")
# top right plot
plot(data$DateTime
     , data$Voltage
     , type = "l"
     , ylab = "Voltage"
     , xlab = "datetime")
# botom left plot
plot(data$DateTime
     , data$Sub_metering_1
     , type = "l"
     , col = "black"
     , xlab = ""
     , ylab = "Energy sub metering")
lines(data$DateTime
      , data$Sub_metering_2
      , col = "red")
lines(data$DateTime
      , data$Sub_metering_3
      , col = "blue")
legend("topright"
       , col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = 1
       , lwd = 3
       , bty = "n")
# botom right plot
plot(data$DateTime
     , data$Global_reactive_power
     , type = "l"
     , ylab = "Global_reactive_power"
     , xlab = "datetime")
# close the png device
dev.off()