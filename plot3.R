// Read file
hpc <- read.csv("household_power_consumption.txt", sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

// Filter data with dates
filteredData <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

// Create Datetime column 
filteredData$Datetime <- strptime(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %H:%M:%S")

// Drop the date and time columns
filteredData$Date <- NULL
filteredData$Time <- NULL

// Open png file
png(filename = "plot3.png", width = 480, height = 480)

// Draw the graphs to png
plot(filteredData$Datetime, filteredData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(filteredData$Datetime, filteredData$Sub_metering_2, col = "red")
lines(filteredData$Datetime, filteredData$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

// Close png file
dev.off()
