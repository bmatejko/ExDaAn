# Preparing variables
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
