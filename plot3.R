setwd("C:/Users/rgelber/Desktop/Data Science Files")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "C:/Users/rgelber/Desktop/Data Science Files/exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("C:/Users/rgelber/Desktop/Data Science Files/exdata%2Fdata%2Fhousehold_power_consumption.zip")

data <- read.table("C:/Users/rgelber/Desktop/Data Science Files/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(newdata$Date, newdata$Time, sepdata = " "),"%d/%m/%Y %H:%M:%S")
newdata <- cbind(time, newdata)

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(newdata$time, newdata$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(newdata$time, newdata$Sub_metering_2, col=columnlines[2])
lines(newdata$time, newdata$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")