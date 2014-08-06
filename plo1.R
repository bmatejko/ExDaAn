#Downloading dataset

baza <- read.csv("F:/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

# Preparing variables

baza$Date[66637:69516] # date from 1/1/2007 to 2/1/2007
baza<-baza[66637:69516,]
baza$Global_active_power<-as.numeric(as.character(baza$Global_active_power))

#Hist

with(baza, hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))

#Making png file

dev.copy(png, file="plot1.png")
dev.off()
