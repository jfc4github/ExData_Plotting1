## Exploratory data course Project 01

## library required
library(data.table)

## Read the data

x <- fread("household_power_consumption.txt")

## Convert the dates to a proper class

x$Date <- as.Date(x$Date, format="%d/%m/%Y")

## Subset

y <- x[x$Date=="2007-02-01" | x$Date=="2007-02-02"]

## Get the data in proper format
y <- data.frame(y)

for(i in c(3:9)) {y[,i] <- as.numeric(as.character(y[,i]))}

y$Global_active_power <- as.numeric(y$Global_active_power)

y$Date_Time <- paste(y$Date, y$Time)

y$Date_Time <- strptime(y$Date_Time, format="%Y-%m-%d %H:%M:%S")

## Open the required device

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

## Create the plot

par(mar = c(6, 6, 5, 4))

plot(y$Date_Time, y$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")

lines(y$Date_Time, y$Global_active_power, type="S")

## Close the device

dev.off()
