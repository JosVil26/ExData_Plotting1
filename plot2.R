electric <- read.csv("household_power_consumption.txt", sep = ";", 
                     stringsAsFactors = F)
electric$DateTime <- paste(electric$Date, electric$Time, sep = " ")
electric$DateTime <- strptime(electric$DateTime, format = "%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric <- electric[electric$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

plot(electric$DateTime, as.numeric(electric$Global_active_power), 
     xlim = as.POSIXct(c('2007-02-01 00:00:00', '2007-02-02 23:59:59')), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
