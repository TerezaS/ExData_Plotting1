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
png(file = "plot3.png")
# create the plot
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
       , lwd = 3)
# close the png device
dev.off()
