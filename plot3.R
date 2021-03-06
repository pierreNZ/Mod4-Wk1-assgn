#set working directory and read the data set
setwd("F:/Coursera/Exploratory data analysis Module 4 Week1 assigment/Mod4 Wk1 peer-graded assign - pierreNZ")
dataFile <- "./data/household_power_consumption.txt"
household_power_consumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset only the dates 1 and 2 Feb 2007
Two_dates_subSet <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#inspect the data table
head(Two_dates_subSet)
str(Two_dates_subSet)

#create datetime object as POSIXlt
datetime <- strptime(paste(Two_dates_subSet$Date, Two_dates_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#extract Sub_metering data sets as numeric vectors
Sub_metering_1 <- as.numeric(Two_dates_subSet$Sub_metering_1)
Sub_metering_2 <- as.numeric(Two_dates_subSet$Sub_metering_2)
Sub_metering_3 <- Two_dates_subSet[ ,"Sub_metering_3"]

#initialise the png file device
png("plot3.png", width=480, height=480)

#create plot3
plot(datetime,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#turn off the png device
dev.off()