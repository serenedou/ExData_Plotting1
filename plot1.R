# first push the fork from github to local, then create a R file at this local file, then use git add and the the steps in the creenshot, remember the m"message" to aviod the window of adding message coming out.
data <- read.table("household_power_consumption.txt", sep=";",skip=66636,header=FALSE, nrow=2880)#formula to read the subset data
head(data)
tail(data)

#name varialbles
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

#ploting
hist(data$Global_active_power,xlab="Global Active Power (Kilowatts)",main="Global Active Power", col="red")

#save as png files
dev.copy(png,file="plot1.png")
dev.off()

#calculate the columuns and rows
x<-as.POSIXct("2006-12-16 17:24")
y<-as.POSIXct("2007-2-2 24:00")
z<-as.POSIXct("2007-2-1 00:00")
difftime(z,x,units='mins')
difftime(y,z,units='mins')
difftime(y,x,units='mins')

