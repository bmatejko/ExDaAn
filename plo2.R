#Downloading dataset

baza <- read.csv("F:/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

# Preparing variables

baza$Date[66637:69516] # date from 1/1/2007 to 2/1/2007
baza<-baza[66637:69516,]

#making variable time
baza$Data2<-baza$Date
baza$Data2<-as.Date(as.character(baza$Date), "%e/%m/%Y")
baza$pasteTime <- paste(baza$Data2, baza$Time)
baza$pasteTime<-strptime(baza$pasteTime,"%Y-%m-%d %T")

#Plot
with(baza, plot(pasteTime, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))

#Making png file
dev.copy(png, file="plot2.png")
dev.off()
