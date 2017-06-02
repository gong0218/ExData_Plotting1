##plot1.R

rm(list=ls())

## Download data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
x <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",stringsAsFactors = FALSE)
unlink(temp)

## modify variables
f12 <- subset(x,x$Date == "2/2/2007" | x$Date == "1/2/2007")
f12$Global_active_power <- as.numeric(f12$Global_active_power)

## create png
png("plot1.png", width = 480, height = 480)
par(mfrow=c(1,1))

hist(f12$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off() 
