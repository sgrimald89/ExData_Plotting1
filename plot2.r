
#Checks if data is in working directory. If not, downloads it and unzips it.
if (!file.exists("household_power_consumption.txt")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", method="curl")
        unzip("power.zip")
}
#Reads data in. If a "?" appears, it is treated as an NA
hhPower<-read.table("household_power_consumption.txt",header=TRUE,sep=';', na.strings="?")
#Stores only the subset of the dataset from Feb 1 and Feb 2 2007.
hhPower<-subset(hhPower,hhPower$Date=="1/2/2007" | hhPower$Date=="2/2/2007")
#Combines the Date and time string variables
hhPower$DateTime<-paste(hhPower$Date,hhPower$Time)
#Changes the DateTime variable into Time format from string format
hhPower$DateTime<-strptime(hhPower$DateTime,format="%d/%m/%Y %H:%M:%S")
#Creates Plot2
png(filename="plot2.png", width=480, height=480, units="px")
plot(hhPower$DateTime,hhPower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
