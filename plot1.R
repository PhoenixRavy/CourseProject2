#Q1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# sUM EMISSIONS BY YEAR
sum_em_year <- aggregate(Emissions ~ year, NEI, sum)

#creating the plot
png("plot1.png",width=480,height=480)

barplot((sum_em_year$Emissions)/10^6,
        names.arg=sum_em_year$year,
        xlab="Year",
        ylab="Emissions of PM2.5 (tons)",
        main="Total emissions of PM2.5 in US by these specific years")
dev.off()

