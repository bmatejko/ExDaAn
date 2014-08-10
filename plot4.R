#Downloading dataset

baza <- read.csv("F:/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

# Preparing variables

baza$Date[66637:69516] # date from 1/1/2007 to 2/1/2007
baza<-baza[66637:69516,]


par(mfrow=c(2,2))
#plot1

with(baza, plot(pasteTime, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
#Preparing variables
baza$Global_active_power<-as.numeric(as.character(baza$Global_active_power))

baza$Data2<-baza$Date
baza$Data2<-as.Date(as.character(baza$Date), "%e/%m/%Y")
baza$pasteTime <- paste(baza$Data2, baza$Time)
baza$pasteTime<-strptime(baza$pasteTime,"%Y-%m-%d %T")

baza$Voltage2<-as.numeric(as.character(baza$Voltage))
baza$Global_reactive_power<-as.numeric(as.character(baza$Global_reactive_power))

#plot2
with(baza, plot(pasteTime, Voltage2, type="l",xlab="datetime", ylab="Voltage"))

#plot3
with(baza, plot(pasteTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
points(baza$pasteTime, baza$Sub1, type="l", col="green")
points(baza$pasteTime, baza$Sub2, type="l", col="red")
points(baza$pasteTime, baza$Sub3, type="l", col="blue")
legend("topright", c("Sub metering_1","Sub metering_2", "Submetering_3"), col=c("green","red","blue"), lty=c(1,1,1), cex=0.7, bty="n" )

#plot4
with(baza, plot(pasteTime, Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power"))

#Making png file
dev.copy(png, file="plot4.png")
dev.off()