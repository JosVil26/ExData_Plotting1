electric <- read.csv("household_power_consumption.txt", sep = ";", 
                     stringsAsFactors = F)
electric$DateTime <- paste(electric$Date, electric$Time, sep = " ")
electric$DateTime <- strptime(electric$DateTime, format = "%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric <- electric[electric$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

subMetering1 <- as.numeric(electric$Sub_metering_1)
subMetering2 <- as.numeric(electric$Sub_metering_2)
subMetering3 <- as.numeric(electric$Sub_metering_3)

plot(electric$DateTime, subMetering1, 
     xlim = as.POSIXct(c('2007-02-01 00:00:00', '2007-02-02 23:59:59')), 
     type = "l", ylab = "Energy sub metering", xlab = "")
lines(electric$DateTime, subMetering2, type = "l", col = "red")
lines(electric$DateTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
