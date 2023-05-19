data <- read.table("./dados/household_power_consumption.txt", header=TRUE, sep=";")
data2 <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data2$Global_active_power)
GRP <- as.numeric(data2$Global_reactive_power)
voltage <- as.numeric(data2$Voltage)
sub1 <- as.numeric(data2$Sub_metering_1)
sub2 <- as.numeric(data2$Sub_metering_2)
sub3 <- as.numeric(data2$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()