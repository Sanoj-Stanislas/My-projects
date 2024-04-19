library(dplyr) #provides the filter function. it works very similarly to subset (base r function) but is faster
library(rlist)
library(tidyverse)
library(ggplot2)
# for boxplots
library(hrbrthemes)
library(viridis)

#====
#subset data and plot
#====
filter_data <- function(dataset, column, data1) {
  empty <- data.frame(matrix(ncol = 0, nrow = 0))
  
  if (column == "env"){
    
    for (i in data1){
      
      subset <- dataset %>%  filter(env == (i))
      empty = rbind(empty,subset)
      
    }
    boxplot(Length ~ env, data = empty,col="#69b3a2")
  } else if (column == "day"){
    for (i in data1){
      
      subset <- dataset %>%  filter(day == (i))
      empty=rbind(empty,subset)
    }
    boxplot(Length ~ day, data = empty,col="#69b3a2")
  } else if (column == "sample"){
    for (i in data1){
      
      subset <- dataset %>%  filter(sample == (i))
      empty=rbind(empty,subset)
      
    }
    boxplot(Length ~ sample, data = empty,col="#69b3a2")
  } else if (column == "strain"){
    for (i in data1){
      
      subset <- dataset %>%  filter(strain == (i))
      empty=rbind(empty,subset)
      
    } 
    boxplot(Length ~ strain, data = empty,col="#69b3a2")
  } else print("Error in column: column input does not exist")
}

# data set = data
# column = the column we are using to subset
# data1 = values within the column that are being selected


# create filter for the function
#insert values into function

#====
# Box Plot
#====

lnames = load(file = "data_processed/dataComplete.RData")

#=====
# WT boxplots
#=====
pwt <- ggplot(data = subset(df, strain == "wt"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() + ggtitle("A")
print(pwt)
## axis.text.x for x axis only
black.bold.14.text <- element_text(face = "bold", color = "black", size = 14)

#Change text style in title and X/Y axis labels
black.bold.text <- element_text(face = "bold", color = "black")

# plot modification
pwt + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"),
                                                                 labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12))



# One box per condition
p1 <- ggplot(data = subset(df, strain == "wt"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~env) + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()
  ) + ggtitle("Wild-type on different condition") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p1)

# one box per days
p2 <- ggplot(data = subset(df, strain == "wt"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") +
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()) + ggtitle("Wild-type on different days") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p2)

# A means wild type under different condition and days

#====
# elf3 boxplots
#====
# grouped boxplot
pme <- ggplot(data = subset(df, strain == "me"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() + ggtitle("B")
#  (B) "elf3 under different photoperiods and days"


# A means wild type under different condition and days
# print plot
print(pme)


## axis.text.x for x axis only
black.bold.14.text <- element_text(face = "bold", color = "black", size = 14)

#Change text style in title and X/Y axis labels
black.bold.text <- element_text(face = "bold", color = "black")

# plot modification
pme + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"),
                                                                 labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12))



# One box per condition
p1 <- ggplot(data = subset(df, strain == "me"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~env) + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()
  ) + ggtitle(" elf3 on different condition") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p1)

# one box per days
p2 <- ggplot(data = subset(df, strain == "me"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()) + ggtitle("elf3 on different days") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p2)

#====
# phyB boxplots
#====
# grouped boxplot
pmp <- ggplot(data = subset(df, strain == "mp"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() + ggtitle("C")

#  (c) "PhyB under different photo periods and days"

# print plot
print(pmp)


## axis.text.x for x axis only
black.bold.14.text <- element_text(face = "bold", color = "black", size = 14)

#Change text style in title and X/Y axis labels
black.bold.text <- element_text(face = "bold", color = "black")

# plot modification
pmp + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"),
                                                                 labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12))

# One box per condition
p1 <- ggplot(data = subset(df, strain == "mp"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~env) + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()
  ) + ggtitle(" phyB on different condition") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p1)
# one box per days
p2 <- ggplot(data = subset(df, strain == "mp"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()) + ggtitle("phyB on different days") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p2)


#====
# Double mutant boxplots
#====
# double mutant (elf3phyB) boxplots
# grouped boxplot
pdm <- ggplot(data = subset(df, strain == "dm"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() + ggtitle("D")

#  (D) "elf3PhyB under different photo periods and days"


# A means wild type under different condition and days
# print plot
print(pdm)


## axis.text.x for x axis only
black.bold.14.text <- element_text(face = "bold", color = "black", size = 14)

#Change text style in title and X/Y axis labels
black.bold.text <- element_text(face = "bold", color = "black")

# plot modification
pdm + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"),
                                                                 labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12))


# One box per condition
p1 <- ggplot(data = subset(df, strain == "dm"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~env) + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()
  ) + ggtitle(" elf3phyB on different condition") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p1)
# one box per days
p2 <- ggplot(data = subset(df, strain == "dm"), aes(x=day, y=Length, fill=env)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + 
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()) + ggtitle("elf3phyB on different days") + labs(fill = "condition") + theme(legend.position="top") + scale_fill_discrete(name = "condition", labels = c("SD-SD", "LD-LD", "SD-LD", "LD-SD")) +
  xlab("Day") + ylab("Hypocotyl length (cm)") + scale_x_discrete(breaks=c("d3","d4","d5", "d6", "d7", "d8"), labels=c("3", "4", "5", "6", "7", "10")) + theme(axis.text = black.bold.14.text) + theme(title = black.bold.text, axis.title = black.bold.text) + theme(legend.text = element_text(size = 12)) 
plot(p2)
#====


#=======
# Box plots for Sample comparison (To test Batch effect)
#=======

# grouped boxplot wt samples
#====
ggplot(data = subset(df, strain == "wt"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() + ggtitle("Wild-type sample comparison on different days")
# One box per condition
p1 <- ggplot(data = subset(df, strain == "wt"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~env) + ggtitle("Wild-type samples on different photoperiod conditions")
# one box per days
p2 <- ggplot(data = subset(df, strain == "wt"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + ggtitle("Wild-type samples on different days")

plot(p1)
plot(p2)
# Grouped boxplots of elf3 samples
#====
# grouped boxplots of elf3 samples
#====
ggplot(data = subset(df, strain == "me"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() + ggtitle("elf3 samples under different and days")

# One box per condition
p1 <- ggplot(data = subset(df, strain == "me"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~env) + ggtitle("elf3 samples on different photoperiod conditions")
# one box per days
p2 <- ggplot(data = subset(df, strain == "me"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + ggtitle("elf3 samples on different days")

plot(p1)
plot(p2)
#====
# Grouped boxplots of PhyB samples 
#====
ggplot(data = subset(df, strain == "mp"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() + ggtitle("phyB samples under different and days")

# One box per condition
p1 <- ggplot(data = subset(df, strain == "mp"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~env) + ggtitle("PhyB samples on different photoperiod conditions")
# one box per days
p2 <- ggplot(data = subset(df, strain == "mp"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + ggtitle("PhyB samples on different days")

plot(p1)
plot(p2)
# Grouped boxplots of elf3PhyB samples 
#=====
### Grouped Boxplots elf3phyb samples 
#####
ggplot(data = subset(df, strain == "dm"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() + ggtitle("elf3phyB samples under different and days")

# One box per condition
p1 <- ggplot(data = subset(df, strain == "dm"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~env) + ggtitle("elf3PhyB samples on different photoperiod conditions")
# one box per days
p2 <- ggplot(data = subset(df, strain == "dm"), aes(x=day, y=Length, fill=sample)) + 
  geom_boxplot() +
  facet_wrap(~day, scale="free") + ggtitle("elf3PhyB samples on different days")

plot(p1)
plot(p2)
#====


#====
# Line Plot
#====
lnames = load(file = "data_processed/dataComplete.RData")

list_env = c("c1","c2","c3","c4") 
list_day = c("d3","d4","d5","d6","d7","d8")
list_strain = c("wt", "me", "mp", "dm")

summary_data = list()

for (i in list_env) {
  name_env = i
  
  columns = c("env","day","strain", "mean_length", "sd_length")
  
  for (x in list_day) {
    name_day = x
    
    for (y in list_strain) {
      name_strain = y
      
      
      nan <- data.frame(matrix(ncol = length(columns), nrow = 0))
      colnames(nan) = columns
      
      temp =  subset(df, env == i & day == x & strain == y)
      mean = mean(temp$Length)
      sd = sd(temp$Length)
      
      nan[1,1] = i
      nan[1,2] = x
      nan[1,3] = y
      nan[1,4] = mean
      nan[1,5] = sd
      #####
      #new_name_mean = paste("df",
      #                 paste(name_env),
      #                paste(name_day),
      #                 paste(name_strain),
      #                 "mean", sep="_")
      
      #new_name_sd = paste("df",
      #                 paste(name_env),
      #                 paste(name_day),
      #                 paste(name_strain),
      #                 "sd", sep="_")
      
      #assign(new_name_mean, temp_mean)
      #assign(new_name_sd, temp_sd)
      #####
      
      #adding file to a list for merging with "data"
      list = list(nan)     
      
      #appending the data frame to the existing list of data frames
      summary_data = c(summary_data, list)
      
    }  }  }

columns = c("env","day","strain", "mean_length", "sd_length")
summary <- data.frame(matrix(ncol = length(columns), nrow = 0))
colnames(summary) = columns

for (i in summary_data) {
  summary = rbind(summary, i)
}



lpwt <- ggplot(data = subset(summary, strain == "wt"), aes(x=day, y= mean_length, group=env, color =env)) + 
  geom_line() +
  geom_pont() +
 
  #+geom_pointrange(aes(ymin=mean_length-sd_length, ymax=mean_length+sd_length))
# means wild type under different condition and days

print(lpwt)

lpwt + labs(title="A", x="Days", y = "Mean hypocotyl length (cm)")+
  theme_classic() +
  scale_color_manual(values=c('#999999','#E69F00','#0000FF', '#00FF00'))

