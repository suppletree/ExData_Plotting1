## setwd("~/cr3wk1")

## Read data and set "?" as NA
pconsumeData <- read.table("./household_power_consumption.txt",  sep = ";", na.strings = "?", header = TRUE)

## Subset the dataset to only 2007-02-01 and 2007-02-02
pconsumeData <- subset(pconsumeData, Date %in% c("1/2/2007","2/2/2007"))


## Create a "DateTime" column
pconsumeData$DateTime <- paste(pconsumeData$Date, pconsumeData$Time)

## Change Date variable to Date class
pconsumeData$DateTime <- strptime(pconsumeData$DateTime,"%d/%m/%Y %H:%M:%S")

## Remove Date & Time columns - we don't need them anymore
pconsumeData <- pconsumeData[,!(names(pconsumeData) %in% c("Date","Time"))]

## Make Line Graph and save it to PNG
png(filename="plot2.png",width=480,height=480)
plot(pconsumeData$DateTime, pconsumeData$Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)", xlab="")
dev.off()
