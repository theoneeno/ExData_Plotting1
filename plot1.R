plot1<-function(){
  
  if(!file.exists("data")){dir.create("data")}
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./data/data.zip")
  library(utils)
  unzip("./data/data.zip",exdir="./data")
  alldata<-read.table("./data/household_power_consumption.txt",sep=";",head=T)
  alldata$Date<-as.Date(alldata$Date,format="%d/%m/%Y")
  data<-subset(alldata,alldata$Date=="2007-02-02"|alldata$Date=="2007-02-01")
  datetime<-paste(data$datetime,data$Date)
  datetime<-strptime(datetime,format="%Y-%m-%d %H:%M:%S")
  datetime<-paste(as.character(data$Date),as.character(data$Time))
  data<-cbind(datetime,data)
  
  
  png(file="./data/plot1.png")
  hist(as.numeric(as.character(data$Global_active_power)),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
  dev.off()
  
}