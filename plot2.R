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
png(filename = "plot2.png", width = 480, height = 480)

// Draw the plot to png
plot(filteredData$Datetime, filteredData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

// Close png file

dev.off()
