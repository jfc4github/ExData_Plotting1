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

## Open the required device (2x2)

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2, 2), mar = c(14, 6, 2, 2), cex=.5)

## Create the plot 1 (top-left)

plot(y$Date_Time, y$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")

lines(y$Date_Time, y$Global_active_power, type="S")

## Create the plot 2 (top-right)

plot(y$Date_Time, y$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")

lines(y$Date_Time, y$Voltage, type="S")

## Create the plot 3 (bottom-left)

plot(y$Date_Time, y$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")

lines(y$Date_Time, y$Sub_metering_1, col = "black", type = "S")

lines(y$Date_Time, y$Sub_metering_2, col = "red", type = "S")

lines(y$Date_Time, y$Sub_metering_3, col = "blue", type = "S")

legend("topright", bty = "n", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create the plot 4 (bottom-right)

plot(y$Date_Time, y$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global_reactive_power", type="n")

lines(y$Date_Time, y$Global_reactive_power, type="S")

## Close the device
dev.off()