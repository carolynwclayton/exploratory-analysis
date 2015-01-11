#####
# Author: Carolyn Clayton
# Date: 2015/01/08
# This is the import file for Course Project 1 for Exploratory Data Analysis
#####

#####
# IMPORT AND FORMAT VARIABLES
#####

require(checkpoint)
checkpoint(snapshot = "2014-12-01", project = getwd(), verbose = T)
require(data.table)
data <- fread("household_power_consumption.txt", na.strings = c("?", "NA", ""), verbose = TRUE)
length(which(is.na(data)))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]
data$Global_active_power <- as.numeric(data$Global_active_power)

#####
# PLOT 1
#####

hist(data$Global_active_power[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"],
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power"
)
dev.copy(png, file = "plot1.png")
dev.off()