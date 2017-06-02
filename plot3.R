##plot3.R

rm(list=ls())

## Download data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
x <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",stringsAsFactors = FALSE)
unlink(temp)

## modify variables
f12 <- subset(x,x$Date == "2/2/2007" | x$Date == "1/2/2007")
f12$Sub_metering_1 <- as.numeric(f12$Sub_metering_1)
f12$Sub_metering_2 <- as.numeric(f12$Sub_metering_2)
f12$Sub_metering_3 <- as.numeric(f12$Sub_metering_3)
f12$DateTime <- paste(f12$Date, f12$Time)
f12$DateTime <- strptime(f12$DateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","us")

## create png
png("plot3.png", width = 480, height = 480)
par(mfrow=c(1,1))

plot(f12$DateTime, f12$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
points(f12$DateTime, f12$Sub_metering_2, col="red",type = "l")
points(f12$DateTime, f12$Sub_metering_3, col="blue",type = "l")

## make legend
legend("topright", lty =1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off() 
