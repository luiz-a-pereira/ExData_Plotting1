data <- read.table("./dados/household_power_consumption.txt", header=TRUE, sep=";")
data2 <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

GAP <- as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
