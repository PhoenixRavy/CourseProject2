#Q3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Baltimore's subset to fip.
NEI_baltimore <- NEI[ NEI$fips=="24510", ]

# Summarize Baltimore's city emissions per year
sum_NEI_Baltimore <- aggregate(Emissions ~ year, NEI_baltimore, sum)

png("plot3.png",width=480,height=480)

library(ggplot2)

plottosave <- ggplot(NEI_baltimore, aes(factor(year), Emissions, fill=type)) + geom_bar(stat="identity") + theme_bw() + 
    guides(fill=FALSE) +  facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", y=expression("PM"[2.5]*" total emission (Tons)")) + 
    labs(title=expression("Emissions of PM"[2.5]*", in Baltimore City, Maryland for these specific years"))

print(plottosave)
dev.off()
