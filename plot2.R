power<-read.table("household_power_consumption.txt", header=TRUE, 
                  sep=";", na.strings="?", 
                  colClasses = c("character", "character", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric") )

##make a copy before overwriting, just in case
power2<-power
dttm<-paste(power2$Date, power2$Time)
power2<-cbind(power2, dttm)

power2$Date <- strptime(power2$Date, "%d/%m/%Y")
power2$Time <- strptime(power2$Time, "%H:%M:%S")
power2$dttm <- strptime(power2$dttm, "%d/%m/%Y %H:%M:%S")


##subset dates of interest
power3<-subset(power2, Date %in% c("2007-02-01", "2007-02-02"))



##make & output plot
png(file="plot2.png")

plot(power3$dttm, power3$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="", type="n")
lines(power3$dttm, power3$Global_active_power, lty=1)

dev.off()