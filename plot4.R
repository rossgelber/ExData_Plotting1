setwd("C:/Users/rgelber/Desktop/Data Science Files")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "C:/Users/rgelber/Desktop/Data Science Files/exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("C:/Users/rgelber/Desktop/Data Science Files/exdata%2Fdata%2Fhousehold_power_consumption.zip")

data <- read.table("C:/Users/rgelber/Desktop/Data Science Files/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(newdata$Date, newdata$Time, sepdata = " "),"%d/%m/%Y %H:%M:%S")
newdata <- cbind(time, newdata)

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(newdata$time, newdata$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(newdata$time, newdata$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(newdata$time, newdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(newdata$time, newdata$Sub_metering_2, type="l", col="red")
lines(newdata$time, newdata$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(newdata$time, newdata$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")