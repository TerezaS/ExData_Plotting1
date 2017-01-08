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
# open the png device
png(file = "plot2.png", width=480, height=480)
# create the plot
plot(data$DateTime
     , data$Global_active_power
     , type = "l"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = "")
# close the png device
dev.off()