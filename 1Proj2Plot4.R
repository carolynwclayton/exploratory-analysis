#####
# Author: Carolyn Clayton
# Date: 2015/01/08
# Exploratory Data Analysis: Project 1: Plot 4
#####

#####
# IMPORT AND FORMAT VARIABLES
#####

par(bg = "white", mfrow = c(2, 2), mar = c(4, 4, 2, 2))
require(checkpoint)
checkpoint(snapshot = "2014-12-01", project = getwd(), verbose = T)
require(data.table)
data <- fread("household_power_consumption.txt", na.strings = c("?", "NA", ""), verbose = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$DateTime <- as.POSIXct(paste(as.character(data$Date),as.character(data$Time)))

#####
# PLOT 1
#####

with(data, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n"))
with(data, lines(DateTime, Global_active_power))

#####
# PLOT 2
#####

with(data, plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "n"))
with(data, lines(DateTime, Voltage))

#####
# PLOT 3
#####

with(data, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, text.width = strwidth("Sub_metering_1"), bty = "n")

#####
# Plot 4
#####

with(data, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n"))
with(data, lines(DateTime, Global_reactive_power))

dev.copy(png, file = "plot4.png")
dev.off()