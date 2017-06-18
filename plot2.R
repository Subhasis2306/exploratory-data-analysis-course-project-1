# Load required packages
library(data.table)
library(dplyr)

# Read the dataset from the specified dates only
pwrfile <- fread("household_power_consumption.txt", na.strings = "?")
pwrfile[,DateTime := strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")]
pwrdata <- filter(pwrfile, DateTime >= "2007-02-01", DateTime < "2007-02-03")

# Open a new graphics device in png
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Plot the required graph
plot(pwrdata$DateTime, pwrdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)" , type = "n")
lines(pwrdata$DateTime, pwrdata$Global_active_power)

# Close the graphic device
dev.off()