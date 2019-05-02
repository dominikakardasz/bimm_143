#' ---
#' title: "Crop Analysis Q3 2013"
#' author: "Dominika Kardasz"
#' date: "April 16th, 2019"
#' ---

#Class R graphics
#BIMM 143 Lab 5

#2A line 
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)

#plot age vs weight

plot(weight$Age, weight$Weight )

plot (weight, xlab="Age(months)", 
      ylab="Weight(kg)", 
      pch=15,
      typ="b",
      main="Some title",
      cex=1.5)

#2B line 
feat <- read.table("bimm143_05_rstats/feature_counts.txt",
                   header = TRUE, sep = "\t" )
#plot the bargraph
barplot(feat$Count)

old.par <- par()
#make the barplot nicer 
par(mar=c(4,11,1,1))
barplot(feat$Count, names.arg=feat$Feature, xlab="A title", 
        horiz=TRUE, main="Some title" , las=1)
par(mar=old.par)
#3 line 

counts <- read.table("bimm143_05_rstats/male_female_counts.txt",
                    sep="\t", header = TRUE)
# delim is a connvenience function , can use that to save
#the writing header etc
counts <-read.delim("bimm143_05_rstats/male_female_counts.txt")

barplot(counts$Count, names.arg = counts$Sample, las=2, 
        col=rainbow(50))
