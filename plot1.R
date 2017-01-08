## read data
data <- fread("household_power_consumption.txt", na.strings = "?")

## subset data to have only relevant days
data <- data[Date %in% c("1/2/2007", "2/2/2007"), ]

## open png device
png(file = "plot1.png")
## create the histogram 
hist(data$Global_active_power
     , col = "red"
     , xlab = "Global Active Power (kilowatts)"
     , main = "Global Active Power")
## close the device
dev.off()