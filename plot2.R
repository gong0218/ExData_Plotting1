##plot2.R

rm(list=ls())

## Download data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
x <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",stringsAsFactors = FALSE)
unlink(temp)

## modify variables
f12 <- subset(x,x$Date == "2/2/2007" | x$Date == "1/2/2007")
f12$Global_active_power <- as.numeric(f12$Global_active_power)
f12$DateTime <- paste(f12$Date, f12$Time)
f12$DateTime <- strptime(f12$DateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","us")

## create png
png("plot2.png", width = 480, height = 480)
par(mfrow=c(1,1))

## plot. modify y label. delete xlabel.
plot(f12$DateTime, f12$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off() 
