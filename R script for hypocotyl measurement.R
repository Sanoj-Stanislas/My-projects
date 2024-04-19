# Hypocotyl elongation measurement 
hypo <- read.csv("SD day 4 sample1_WT.csv")
colnames(hypo)
dim(hypo)
# check for factors always
hypo[1,"Area"]+1  
c(1:1)
hypo17<-hypo[1:17,]
# double check the rows when reloading
hist(hypo17[,"Length"])
# Check for data 
# vector with all names of the file, make a loop with 
file_hypcot<- c("LD day 3 sample1_elf3.csv","LD day 3 sample1_elf3_phyB.csv","LD day 3 sample1_phyB.csv",
     "LD day 3 sample1_WT.csv","SD day 3 sample1_elf3.csv","SD day 3 sample1_elf3_phyB.csv","SD day 3 sample1_phyB.csv",
     "SD day 3 sample1_WT.csv", "SD day 4 sample1_WT.csv")

for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}

# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot
names(hypolist)=file_hypcot
boxplot(hypolist)

# next week, make box plots, names shorter, add color, 
####### The shift plants are in SD and LD in in day 3####
##SDWT

# Clarify
##paste('SDWT/SD day ',file_hycot)


## All SD WT ##

file_hypcot<- c("SD day 3 sample1_WT.csv", "SD day 4 sample1_WT.csv", "SD day 5 sample1_WT.csv", 
                "SD day 6 sample1_WT.csv", "SD day 7 sample1_WT.csv", "SD Day 10 S1 WT.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot

## All SD elf3 ###

file_hypcot<- c("SD day 3 sample1_elf3.csv", "SD day 4 sample1_elf3.csv",
                "SD day 5 sample1_elf3.csv", 
                "SD day 6 sample1_elf3.csv", "SD day 7 sample1_elf3.csv", "SD Day 10 S1 elf3.csv")
paste('SDWT/SD day ',file_hycot)
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All SD phyB ###

file_hypcot<- c("SD day 3 sample1_phyB.csv", "SD day 4 sample1_phyB.csv",
                "SD day 5 sample1_phyB.csv", 
                "SD day 6 sample1_phyB.csv", "SD day 7 sample1_phyB.csv", "SD Day 10 S1 phyB.csv")
paste('SDWT/SD day ',file_hycot)
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All SD elf3+phyB ###

file_hypcot<- c("SD day 3 sample1_elf3_phyB.csv", "SD day 4 sample1_elf3_phyB.csv",
                "SD day 5 sample1_elf3_phyB.csv", 
                "SD day 6 sample1_elf3_phyB.csv", "SD day 7 sample1_elf3_phyB.csv", 
                "SD Day 10 S1 elf3_phyB.csv")
paste('SDWT/SD day ',file_hycot)
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot



## All LD WT ###

file_hypcot<- c("LD day 3 sample1_WT.csv","LD day 4 sample1_WT.csv", 
                "LD day 5 sample1_WT.csv","LD day 6 sample 1_WT.csv", 
                "LD day 7 sample1_WT.csv","LD_D10_S1_WT.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All LD elf3 ###

file_hypcot<- c("LD day 3 sample1_elf3.csv","LD day 4 sample1_elf3.csv", 
                "LD day 5 sample1_elf3.csv","LD day 6 sample 1_elf3.csv", 
                "LD day 7 sample1_elf3.csv","LD_D10_S1_elf3.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All LD phyB ###

file_hypcot<- c("LD day 3 sample1_phyB.csv","LD day 4 sample1_phyB.csv", 
                "LD day 5 sample1_phyB.csv","LD day 6 sample 1_phyB.csv", 
                "LD day 7 sample1_phyB.csv","LD_D10_S1_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All LD elf3_phyB ###

file_hypcot<- c("LD day 3 sample1_elf3_phyB.csv","LD day 4 sample1_elf3_phyB.csv", 
                "LD day 5 sample1_elf3_phyB.csv","LD day 6 sample 1_elf3_phyB.csv", 
                "LD day 7 sample1_elf3_phyB.csv","LD_D10_S1_elf3_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All SD-LD WT ###

file_hypcot<- c("SD-LD day 4 sample1_WT.csv", 
                "SD-LD day 5 sample1_WT.csv","SD-LD day 6 sample 1_WT.csv", 
                "SD-LD day 7 sample1_WT.csv","SD-LD_D10_S1_WT.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot



## All SD-LD elf3 ###

file_hypcot<- c("SD-LD day 4 sample1_elf3.csv", 
                "SD-LD day 5 sample1_elf3.csv","SD-LD day 6 sample 1_elf3.csv", 
                "SD-LD day 7 sample1_elf3.csv","SD-LD_D10_S1_elf3.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot



## All SD-LD phyB ###

file_hypcot<- c("SD-LD day 4 sample1_phyB.csv", 
                "SD-LD day 5 sample1_phyB.csv","SD-LD day 6 sample 1_phyB.csv", 
                "SD-LD day 7 sample1_phyB.csv","SD-LD_D10_S1_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot

## All SD-LD elf3 + phyB ###

file_hypcot<- c("SD-LD day 4 sample1_elf3_phyB.csv", 
                "SD-LD day 5 sample1_elf3_phyB.csv","SD-LD day 6 sample 1_elf3_phyB.csv", 
                "SD-LD day 7 sample1_elf3_phyB.csv","SD-LD_D10_S1_elf3_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All LD-SD WT ###

file_hypcot<- c("LD_SD day 4 sample1_WT.csv", 
                "LD-SD day 5 sample1_WT.csv","LD-SD day 6 sample 1_WT.csv", 
                "LD-SD day 7 sample1_WT.csv","LD-SD_D10_S1_WT.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


## All LD-SD elf3 ###

file_hypcot<- c("LD_SD day 4 sample1_elf3.csv", 
                "LD-SD day 5 sample1_elf3.csv","LD-SD day 6 sample 1_elf3.csv", 
                "LD-SD day 7 sample1_elf3.csv","LD-SD_D10_S1_elf3.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot

## All LD-SD elf3 + phyB ###

file_hypcot<- c("LD-SD day 4 sample1_elf3_phyB.csv", 
                "LD-SD day 5 sample1_elf3_phyB.csv","LD-SD day 6 sample 1_elf3_phyB.csv", 
                "LD-SD day 7 sample1_elf3_phyB.csv","LD-SD_D10_S1_elf3_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot

### day 3 SD vs LD

file_hypcot<- c("LD day 3 sample1_WT.csv","SD day 3 sample1_WT.csv",
                "LD day 3 sample1_elf3.csv","SD day 3 sample1_elf3.csv",
                "LD day 3 sample1_phyB.csv","SD day 3 sample1_phyB.csv",
                "LD day 3 sample1_elf3_phyB.csv","SD day 3 sample1_elf3_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist)

names(hypolist)=file_hypcot


### day 3 SD vs LD -- ver 2.0

file_hypcot<- c("SD day 3 sample1_WT.csv","SD day 3 sample1_elf3.csv",
               "SD day 3 sample1_phyB.csv","SD day 3 sample1_elf3_phyB.csv",
               "LD day 3 sample1_WT.csv","LD day 3 sample1_elf3.csv",
               "LD day 3 sample1_phyB.csv","LD day 3 sample1_elf3_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot

boxplot(hypolist, at=c(3,4,5,6,7,10))

names(hypolist)=file_hypcot


## All LD-SD elf3 + phyB ###

file_hypcot<- c("LD-SD day 4 sample1_elf3_phyB.csv", 
                "LD-SD day 5 sample1_elf3_phyB.csv","LD-SD day 6 sample 1_elf3_phyB.csv", 
                "LD-SD day 7 sample1_elf3_phyB.csv","LD-SD_D10_S1_elf3_phyB.csv")
for (i in file_hypcot) {
  hypo <- read.csv(i)
  hist(hypo[,"Length"])
}
# make box plot 
hypolist<-lapply(file_hypcot, function(file){
  hypo <- read.csv(file)
  hypo[,"Length"]  
})
length(hypolist)
hypolist[[1]]
file_hypcot
names(hypolist)= paste(c(4,5,6,7,10))


boxplot(hypolist, at=c(4,5,6,7,10))



hyplist = list.files()
print(hyplist)
for (i in hyplist)  {
  a = print(i)
  hyp <- read.csv(i)
  hist(hyp[,"Length"])
  assign(a,hyp) 
}


?lmer
?list.files
?list
?length
