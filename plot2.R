setwd("C:/Users/rgelber/Desktop/Data Science Files")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "C:/Users/rgelber/Desktop/Data Science Files/exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("C:/Users/rgelber/Desktop/Data Science Files/exdata%2Fdata%2Fhousehold_power_consumption.zip")

data <- read.table("C:/Users/rgelber/Desktop/Data Science Files/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(newdata$Date, newdata$Time, sepdata = " "),"%d/%m/%Y %H:%M:%S")
newdata <- cbind(time, newdata)

plot(newdata$time, newdata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")