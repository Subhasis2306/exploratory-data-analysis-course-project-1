# Load required packages
library(data.table)
library(dplyr)

# Read the dataset from the specified dates only
pwrfile <- fread("household_power_consumption.txt", na.strings = "?")
pwrfile[,DateTime := strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")]
pwrdata <- filter(pwrfile, DateTime >= "2007-02-01", DateTime < "2007-02-03")

# Open a new graphics device in png
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Set the par options
par(mfrow = c(2,2), mar = c(5.1, 4.1, 3.1, 2.1), cex = .79)

# Plot all the required plots
plot(pwrdata$DateTime, pwrdata$Global_active_power, xlab = "", ylab = "Global Active Power" , type = "n")
lines(pwrdata$DateTime, pwrdata$Global_active_power)
plot(pwrdata$DateTime, pwrdata$Voltage, xlab = "datetime", ylab = "Voltage" , type = "n")
lines(pwrdata$DateTime, pwrdata$Voltage)
plot(pwrdata$DateTime, pwrdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pwrdata$DateTime, pwrdata$Sub_metering_1)
lines(pwrdata$DateTime, pwrdata$Sub_metering_2, col = "red")
lines(pwrdata$DateTime, pwrdata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(pwrdata$DateTime, pwrdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(pwrdata$DateTime, pwrdata$Global_reactive_power)


# Close the opened graphics device
dev.off()