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

## Make plot and save it to PNG
png(filename="plot3.png",width=480,height=480)

with( pconsumeData, 
      { plot(pconsumeData$DateTime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
          lines(pconsumeData$DateTime, Sub_metering_1, col="black")
          lines(pconsumeData$DateTime, Sub_metering_2, col="red")
          lines(pconsumeData$DateTime, Sub_metering_3, col="blue")
      }
)
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.off()
