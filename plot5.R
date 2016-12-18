
#Q5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#create vector to merge scc vehicules
veh <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
scc_veh <- SCC[veh,]$SCC
scc_veh_NEI <- NEI[NEI$SCC %in% scc_veh,]

#Baltimore fip's susbet NEI data
scc_veh_NEI_baltimore <- scc_veh_NEI[scc_veh_NEI$fips =="24510", ]

# create plot
png("plot5.png",width=480,height=480)

ggplot(scc_veh_NEI_baltimore,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) +
    guides(fill=FALSE) + theme_bw() + labs(x="Year", y=expression("PM"[2.5]*" emission (10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor vehicle total emissions in Baltimore City (Maryland) from 1999-2008")) +
    geom_text(aes(label=round(Emissions,0), size=2, hjust=0.5, vjust=1)) + theme(legend.position='none')

dev.off()


#######################
#create vector to merge scc vehicules
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Baltimore fip's susbet NEI data
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510", ]

# create plot
png("plot5.png",width=480,height=480)

ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) +
    theme_bw() +  guides(fill=FALSE) + labs(x="Year", y=expression("PM"[2.5]*" emission (10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor vehicle total emissions in Baltimore City (Maryland) from 1999-2008")) +
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2)) + theme(legend.position='none')

dev.off()
