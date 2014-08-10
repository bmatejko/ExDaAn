#Downloading dataset

baza <- read.csv("F:/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

# Preparing variables

baza$Date[66637:69516] # date from 1/1/2007 to 2/1/2007
baza<-baza[66637:69516,]

#Plot
baza$Sub3<-as.numeric(as.character(baza$Sub_metering_3))
baza$Sub2<-as.numeric(as.character(baza$Sub_metering_2))
baza$Sub1<-as.numeric(as.character(baza$Sub_metering_1))

with(baza, plot(pasteTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
points(baza$pasteTime, baza$Sub1, type="l", col="green")
points(baza$pasteTime, baza$Sub2, type="l", col="red")
points(baza$pasteTime, baza$Sub3, type="l", col="blue")
legend("topright", c("Sub metering_1","Sub metering_2", "Submetering_3"), col=c("green","red","blue"), lty=c(1,1,1))

#Making png file

dev.copy(png, file="plot3.png")
dev.off()