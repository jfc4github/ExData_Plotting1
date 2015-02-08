## Exploratory data course Project 01

## library required
library(data.table)

## Read the data

x <- fread("household_power_consumption.txt")

## Convert the dates to a proper class

x$Date <- as.Date(x$Date, format="%d/%m/%Y")

## Subset

y <- x[x$Date=="2007-02-01" | x$Date=="2007-02-02"]

## Get the data in numeric format

gap <- as.numeric(y$Global_active_power)

## Open the required device

png("plot1.png", width=480, height=480)

## Create the plot

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Close the device

dev.off()
