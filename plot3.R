# Load required packages
library(data.table)
library(dplyr)

# Read the dataset from the specified dates only
pwrfile <- fread("household_power_consumption.txt", na.strings = "?")
pwrfile[,DateTime := strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")]
pwrdata <- filter(pwrfile, DateTime >= "2007-02-01", DateTime < "2007-02-03")

# Open a new graphics device in png
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Plot the required graph
plot(pwrdata$DateTime, pwrdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pwrdata$DateTime, pwrdata$Sub_metering_1)
lines(pwrdata$DateTime, pwrdata$Sub_metering_2, col = "red")
lines(pwrdata$DateTime, pwrdata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the graphics device
dev.off()