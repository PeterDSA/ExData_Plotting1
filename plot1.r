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
png(file = "plot1.png")
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
