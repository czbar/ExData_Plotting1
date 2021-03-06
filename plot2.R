##########################################################################
# Line plot Global Active Power as a function of DateTime
##########################################################################

##################
# Download the file from the URL
# Unzip
# Read into a data frame
#

# download the file from the Web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "temp.txt", method="internal");

# unzip
unzip("temp.txt", "household_power_consumption.txt");

# Read in the data
Epc <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";");

### read completed
##################

# Remove all rows from days other than the 2 we are interested in
Epc<-subset(Epc, (Date %in% c("1/2/2007","2/2/2007")));

# Keep only the rows where Global_active_power is not "?""
# which indicates no data
Epc<-subset(Epc, Global_active_power != "?");

#
# In order to facilitate graphs
# create a column of DateTime class that will
# combine Date and Time from the first 2 columns. 
#
DateTime <- strptime(paste(Epc[,1], Epc[,2], " "), "%d/%m/%Y %H:%M:%S");
Epc<-cbind(Epc,DateTime);

#
# Convert the Global_active_power column
# to type numeric
#
Epc$Global_active_power <- as.numeric(as.character(Epc$Global_active_power));


#
# Initialize the plot without showig the points
#
plot(Epc$DateTime,Epc$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab = "");

# Now draw the lines to get the line graph
lines(Epc$DateTime,Epc$Global_active_power);


# Export to a PNG file
dev.copy(png,filename="plot2.png", width=480, height=480);
dev.off ();