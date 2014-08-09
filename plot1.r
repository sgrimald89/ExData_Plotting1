
#Checks if data is in working directory. If not, downloads it and unzips it.
if (!file.exists("household_power_consumption.txt")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", method="curl")
        unzip("power.zip")
}
#Reads data in. If a "?" appears, it is treated as an NA
hhPower<-read.table("household_power_consumption.txt",header=TRUE,sep=';', na.strings="?")
#Stores only the subset of the dataset from Feb 1 and Feb 2 2007.
hhPower<-subset(hhPower,hhPower$Date=="1/2/2007" | hhPower$Date=="2/2/2007")
#Creates Plot1
png("plot1.png", width=480, height=480, units="px")
hist(hhPower$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
