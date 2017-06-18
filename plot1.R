# Load required packages
library(data.table)
library(dplyr)

# Read the dataset from the specified dates only
pwrfile <- fread("household_power_consumption.txt", na.strings = "?")
pwrfile[,DateTime := strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")]
pwrdata <- filter(pwrfile, DateTime >= "2007-02-01", DateTime < "2007-02-03")

# Open a new graphics device in png
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Plot the histogram
hist(pwrdata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Close the opened graphics device
dev.off()