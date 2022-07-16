require (cna)
library(frscore)
?d.pban
d.pban
mvcna(d.pban)
df<-d.pban
robust<-frscored_cna(df, fit.range = c(0.95, 0.75), granularity = 0.05, type="mv", inus.only=T, )
robust
mvcna(df,con=0.9,cov=0.9,ordering=list("c","PB"))
mvcna(df,con=0.9,cov=0.9,ordering=list("T","PB"))



#Doing the pban coincidence analysis did not find any results
#As there was no result with con and cov equal to 1, I did the robustness analysis
#With the analysis, it was noticed that the configuration with the highest score was C=1=T=2<->PB=1
#which means that African countries with French colonization and transition
#managed have a ban on resources. Thus, it was discovered which outcome
#must request the CNA analysis.To do the CNA analysis again,
#was placed con=0.9 and cov =0.9, and ordering ("C","PB") and ("T","PB"), was
#achieved some results with the PB outcome, including the result with
#higher robustness of all outcomes, mentioned in this text

require(QCA)
require(admisc)
CVR
?CVR
#PART 1
#Calibrate all the original variables and plotting graphs
PRO <-calibrate(CVR$PROTEST, thresholds = "e=0.5, c=1.5, i=3")
plot(CVR$PROTEST, PRO, xlab = "Raw Data", ylab = "Calibrated data")
GEO <- calibrate(CVR$GEOCON, thresholds = "e=0, c=1.25, i=3")
plot(CVR$GEOCON, GEO, xlab = "Raw Data", ylab = "Calibrated data")
DEM <- calibrate(CVR$DEMOC, thresholds = "e=2, c=7, i=9.5")
plot(CVR$DEMOC, DEM, xlab = "Raw Data", ylab = "Calibrated data")
ETH <- calibrate(CVR$ETHFRACT, thresholds = "e=0, c=0.495, i=0.8")
plot(CVR$ETHFRACT, ETH, xlab = "Raw Data", ylab = "Calibrated data")
POL <- calibrate(CVR$POLDIS, thresholds = "e=0, c=0.75, i=3")
plot(CVR$POLDIS, POL, xlab = "Raw Data", ylab = "Calibrated data")
NAT <- calibrate(CVR$NATPRIDE, thresholds = "e=0.5, c=1.5, i=2.5")
plot(CVR$NATPRIDE, NAT, xlab = "Raw Data", ylab = "Calibrated data")

#Create data.frame with all the calibrated variables and the original name cases
fs_CVR <- data.frame(GEO, PRO,DEM,ETH,POL,NAT, row.names = case.names(CVR))
fs_CVR

#run fdcna for the complete dataframe, with outcome PRO
require(cna)
library(frscore)
fscna(fs_CVR)
robust<-frscored_cna(fs_CVR, fit.range = c(0.95, 0.75), granularity = 0.05, type="fs", inus.only=T,print.all=TRUE )
robust
fscna(fs_CVR,con=0.75,cov=0.75, ordering=list("PRO"))


