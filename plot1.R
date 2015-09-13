electric <- read.csv("household_power_consumption.txt", sep = ";", 
                     stringsAsFactors = F)
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric <- electric[electric$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
electric$DateTime <- paste(electric$Date, electric$Time, sep = " ")
electric$DateTime <- strptime(electric$DateTime, format = "%d/%m/%Y %H:%M:%S")
hist(as.numeric(electric$Global_active_power), xlab = 
             "Global Active Power (kilowatts)", col = "red", main = 
             "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
