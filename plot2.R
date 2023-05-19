data <- read.table("./dados/household_power_consumption.txt", header=TRUE, sep=";")
data2 <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()