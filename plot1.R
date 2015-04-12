##########################################################################
# Histogram for Global Active Power
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
# Convert the Global_active_power column
# to type numeric
#
Epc$Global_active_power <- as.numeric(as.character(Epc$Global_active_power));

#
# Draw the histogram with the colours and labels
# as requested.
#
hist(Epc$Global_active_power, col="red", breaks = 12, main="Global Active Power", xlab="Global Active Power (kilowatts)");


# Export to a PNG file
dev.copy(png,filename="plot1.png", width=480, height=480);
dev.off ();