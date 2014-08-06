#Load data
#Assume text file is in the working directory
data  <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactor = FALSE, na.strings = "?")

#Sort out dates and times
data1  <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data1$Date  <- as.Date(data1$Date, format("%d/%m/%Y"))
data1$DateTime <- paste(data1$Date, data1$Time)
dateFormat <- "%Y-%m-%d %H:%M:%S"
data1$DateTime <- strptime(data1$DateTime, dateFormat)

#Create the plot and save to the png device
png(file = "plot4.png")
par(mfrow = c(2, 2))
with (data1, {
    plot(data1$DateTime, data1$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
    plot(data1$DateTime, data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(data1$DateTime, data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data1$DateTime, data1$Sub_metering_2, col="red")
    lines(data1$DateTime, data1$Sub_metering_3, col="blue")
    legend("topright", cex = 0.6, y.intersp = 0.8, lty = c(1, 1, 1), col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(data1$DateTime, data1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()