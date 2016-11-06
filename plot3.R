##Setting Local Working Directory:
## (PLEASE NOTE: That's where I cloned the GitHub repository to on MY local computer!)
setwd("D:/JHSPH Academics/Coursera/Exploratory Data Analysis/Week 1/ExData_Plotting1")

##Reading and Unzipping online ZIP file without Downloading:
TEMP=tempfile()
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",TEMP)
POWER=read.table(unz(TEMP, "household_power_consumption.txt"),header=TRUE,sep=";")
unlink(TEMP)

##Subsetting:
POWER$Date=as.character(POWER$Date)
SUBPOWER=subset(POWER,Date=="1/2/2007" | Date=="2/2/2007")

##Creating a New Variable for "Full-Length" Date&Time:
SUBPOWER$Time=as.character(SUBPOWER$Time)
SUBPOWER$DATETIME=paste(SUBPOWER$Date,SUBPOWER$Time)
SUBPOWER$DATETIME=strptime(SUBPOWER$DATETIME, "%d/%m/%Y %H:%M:%S")

##Converting the Data of "Energy Sub-metering" into Numeric:
SUBPOWER$Sub_metering_1=as.numeric(as.character(SUBPOWER$Sub_metering_1))
SUBPOWER$Sub_metering_2=as.numeric(as.character(SUBPOWER$Sub_metering_2))
SUBPOWER$Sub_metering_3=as.numeric(as.character(SUBPOWER$Sub_metering_3))

##Creating PNG File, and Plotting:
png(file="plot3.png",width=480,height=480)
with(SUBPOWER,{
  plot(DATETIME,Sub_metering_1,type="n",pch="",xlab="",ylab="Energy sub metering")
  lines(DATETIME,Sub_metering_1,type="l",col="black")
  lines(DATETIME,Sub_metering_2,type="l",col="red")
  lines(DATETIME,Sub_metering_3,type="l",col="blue")
  legend("topright",pch="",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()