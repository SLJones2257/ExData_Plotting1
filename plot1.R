power<-read.table("household_power_consumption.txt", header=TRUE, 
                  sep=";", na.strings="?", 
                  colClasses = c("character", "character", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric") )

##make a copy before overwriting, just in case
power2<-power
power2$Date <- strptime(power2$Date, "%d/%m/%Y")
power2$Time <- strptime(power2$Time, "%H:%M:%S")

##subset dates of interest
power3<-subset(power2, Date %in% c("2007-02-01", "2007-02-02"))

##make & output plot
png(file="plot1.png")

hist(power3$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()