data <- read.table("household_power_consumption.txt", sep=";",skip=66637,header=FALSE, nrow=2880)#formula to read the subset data
head(data)
tail(data)
names(data)[1] <- "Date"
names(data)[2] <- "Time"
names(data)[3] <- "Global_active_power"
names(data)[4] <- "Global_reactive_power"
names(data)[5] <- "Voltage"
names(data)[6] <- "Global_intensity"
names(data)[7] <- "Sub_metering_1"
names(data)[8] <- "Sub_metering_2"
names(data)[9] <- "Sub_metering_3"
head(data)
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
with(data,{
  plot(data$Date,data$Global_active_power, type="l", oma=c(2,1,1,1), mar=c(2,1,1,0), cex.sub=2, tcl=-0.2, mgp=c(2,0,0), xlab="", ylab="Global Active Power (Kilowatts)")
  plot(data$Date,data$Voltage, type="l", oma=c(2,1,1,1), mar=c(2,1,1,0), cex.sub=2, tcl=-0.2, mgp=c(2,0,0), xlab="datetime", ylab="Valtage")
  plot(data$Date,data$Sub_metering_1, type="l", oma=c(2,1,1,1), mar=c(1,1,1,0), tcl=-0.2, mgp=c(2,0,0), xlab="", ylab="Energy Sub metering")
  lines(data$Date,data$Sub_metering_2, type="l", oma=c(2,1,1,1), mar=c(1,1,1,0), tcl=-0.2, mgp=c(2,0,0),xlab="",ylab="", col="red")
  lines(data$Date,data$Sub_metering_3, type="l", oma=c(2,1,1,1), mar=c(1,1,1,0), tcl=-0.2, mgp=c(2,0,0),xlab="",ylab="", col="blue")
  plot(data$Date,data$Global_reactive_power, type="l", oma=c(2,1,1,1), mar=c(2,1,1,0), tcl=-0.2, mgp=c(2,0,0), xlab="datetime", ylab="Global_Reactive_Power")
})

dev.copy(png,file="plot4.png")
dev.off()
