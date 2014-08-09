if (!file.exists("household_power_consumption.txt")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", method="curl")
        unzip("power.zip")
}
hhPower<-read.table("household_power_consumption.txt",header=TRUE,sep=';', na.strings="?")
hhPower<-subset(hhPower,hhPower$Date=="1/2/2007" | hhPower$Date=="2/2/2007")
png("plot1.png")
hist(hhPower$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()