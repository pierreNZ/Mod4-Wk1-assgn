#set working directory and read the data set

setwd("F:/Coursera/Exploratory data analysis Module 4 Week1 assigment/Mod4 Wk1 peer-graded assign - pierreNZ")
dataFile <- "./data/household_power_consumption.txt"
household_power_consumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset only the dates 1 and 2 Feb 2007
Two_dates_subSet <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#inspect the data table
head(Two_dates_subSet)
str(Two_dates_subSet)

#create numeric object from Global_active_power
globalActivePower <- as.numeric(Two_dates_subSet$Global_active_power)

#initialise the png file device
png("plot1.png", width=480, height=480)

#create the histogram plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#turn off the png file device
dev.off() 