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

##Converting the Data of "Global Active Power" into Numeric, and Plotting:
SUBPOWER$Global_active_power=as.numeric(as.character(SUBPOWER$Global_active_power))
hist(SUBPOWER$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##Copying the Plot to a PNG File:
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()