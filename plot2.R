#Q2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Baltimore's subset to fip.
NEI_baltimore <- NEI[ NEI$fips=="24510", ]

# summarize Baltimore emissions data per year
sum_NEI_Baltimore <- aggregate(Emissions~year, NEI_baltimore, sum)

png("plot2.png",width=480,height=480)

barplot(sum_NEI_Baltimore$Emissions,
        names.arg=sum_NEI_Baltimore$year,
        xlab="Year",
        ylab="Emissions of PM2.5 (tons)",
        main="Total emissions of PM2.5 in Baltimore City, Maryland")

dev.off()
