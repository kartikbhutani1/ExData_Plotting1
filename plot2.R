#Loading complete data
data <- read.csv("../household_power_consumption.txt", header = T, 
                 sep = ";", na = "?")
data$Date <- format(as.Date(data$Date, format="%d/%m/%Y"), "%d/%m/%Y")

#Subset data
data <- subset(data, (Date == "01/02/2007" | Date == "02/02/2007"))

#Date time conversion
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Plot 2
plot(data$Global_active_power, data$DateTime, type="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", xaxt="n")
rows = nrow(data)
axis(side=1,at=c(1,rows/2,rows),
     labels=c("Thu", "Fri", "Sat"))

#Saving the plot to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

