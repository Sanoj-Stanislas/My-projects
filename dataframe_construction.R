#########################################
##      Hypocotyl Length analysis      ##
#########################################


#### Data Naming convention ####
# photo periods = c1 ..... c8
# c1 = SD, c2 = LD, c3 = SD-LD, c4 = LD-SD
# c5 = SD, c6 = ND, c7 = SD-ND, C8 = ND-SD

# Days = d3, d4, d5, d6, 10
# day 10 is names as just d8 so it could have 2 characters in its name

# mutant lines = wt = WT, me = elf3, mp = phyB, dm = double mutant, elf3/phyB 



# Packages needed
library(dplyr)
library(rlist)
library(tidyverse)
library(ggpubr)

## Setting Working Directory



setwd("C:/Users/sanoj/Desktop/Bioinformatics & Data Science/R/R Project/exp13")
#getting names of all the files
all = list.files()
#making a blank dictionary to hold all the data frames
data = list()



for (i in all) {
  
  #saving i as a variable so the imported data can be renamed
  a = print(i)
  
  #reading file
  temp = read_csv(i)
  
  #change name of 10 in day column into d10
  #day is the second charector in the naming convention
  #10 is 2 charecter & d10 is 3 charecter
  #10 occupies 4,5 charecter and d10 would occupy 4,5,6
  
  
  #in the raw data file all the file needs to be choosen
  #need to select the file names that s
  
  
  
  #extracting data from the file name
  env <- substr(a, 1, 2)
  day <- substr(a, 4, 5)
  sample <- substr(a, 7, 8)
  strain <- substr(a, 10,11)
  
  #making new columns and inserting data based the file name
  temp$env <- env
  temp$day <- day
  temp$sample <- sample
  temp$strain <- strain
 
  #adding file to a list for merging with "data"
  list = list(temp)     
  
  #appending the data frame to the existing list of data frames
  data = c(data, list)
  
}


#renaming the elements based on the files they are based on
names(data) = all

setwd("C:/Users/sanoj/Desktop/Bioinformatics & Data Science/R/R Project")

# empty data frame
columns = c("Length","env","day","sample","strain")
df <- data.frame(matrix(ncol = length(columns), nrow = 0))
colnames(df) = columns


# for loop for rbind
for (i in data) { 
  temp2 = i
  temp3 = temp2[, c(7:11)]
  df = rbind(df, temp3)
}
save(df, file = "data_processed/dataComplete.RData")

## Double checking for inserting everything
b = 0
for (i in data) {
  temp4 = i
  a = nrow(temp4)
  b = b + a 
}

# change columns into factors for stat test
df$env <- as.factor(df$env)
df$day <- as.factor(df$day)
df$sample <- as.factor(df$sample)
df$strain <- as.factor(df$strain)


# separate the strain out of general df
wt_df <- df[df$strain=="wt",]
me_df <- df[df$strain=="me",]
mp_df <- df[df$strain=="mp",]
dm_df <- df[df$strain=="dm",]

#ANOVA for WT on different days
#compares all the conditions within a given day

# wt anova
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
  wt_day_i_df <- wt_df[wt_df$day == day_i, ] 
  print(day_i)
  
  wt_d_aov <- aov(Length~env, wt_day_i_df)
  
  print(summary(wt_d_aov))
}

# elf3 anova
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
  me_day_i_df <- me_df[me_df$day == day_i, ] 
  print(day_i)
  
  me_d_aov <- aov(Length~env, me_day_i_df)
  
  print(summary(me_d_aov))
}

# phyB anova
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
  mp_day_i_df <- mp_df[mp_df$day == day_i, ] 
  print(day_i)
  
  mp_d_aov <- aov(Length~env, mp_day_i_df)
  
  print(summary(mp_d_aov))
}

# elf3phyB anova
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
  dm_day_i_df <- dm_df[dm_df$day == day_i, ] 
  print(day_i)
  
  dm_d_aov <- aov(Length~env, dm_day_i_df)
  
  print(summary(dm_d_aov))
}



# Compare means wt
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
 day_i_df <- wt_df[wt_df$day == day_i, ] 
 print(day_i)
 
 temp_d_aov <- aov(Length~env, day_i_df)
 
 print(summary(temp_d_aov))
 comparison_list <- list(c("c1","c2"),c("c3","c4"))
 wtcomp <- compare_means(Length~env, data = wt_day_i_df, method = "t.test",
                         comparisons=comparison_list)
 print(wtcomp)
}

#compare means of elf3
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
  me_i_df <- me_df[me_df$day == day_i, ] 
  print(day_i)
  
  me_temp_d_aov <- aov(Length~env, day_i_df)
  
  print(summary(me_temp_d_aov))
  comparison_list <- list(c("c1","c2"),c("c3","c4"))
  me_comp <- compare_means(Length~env, data = me_day_i_df, method = "t.test",
                          comparisons=comparison_list)
  print(comp)
}


# t-test between conditions on a given day in WT
comparison_list <- list(c("c1","c3"),c("c2","c4"))
wt_compare_means(Length~env, data = wt_df, method = "t.test", comparisons=comparison_list)

# t-test between conditions on a given day in elf3
me_comparison_list <- list(c("c1","c3"),c("c2","c4"))
me_compare_means(Length~env, data = me_df, method = "t.test", comparisons=comparison_list)

# t-test between conditions on a given day in phyB
mp_comparison_list <- list(c("c1","c3"),c("c2","c4"))
mp_compare_means(Length~env, data = mp_df, method = "t.test", comparisons=comparison_list)

# t-test between conditions on a given day in elf3phyB
dm_comparison_list <- list(c("c1","c3"),c("c2","c4"))
df_compare_means(Length~env, data = dm_df, method = "t.test", comparisons=comparison_list)



# wt anova
for (day_i in c("d3","d4","d5","d6","d7","d8")) {
  wt_day_i_df <- wt_df[wt_df$day == day_i, ] 
  print(day_i)
  
  wt_d_mean <- mean(wt_day_i_df)
  
  print(summary(wt_d_mean))
}




#####
lnames = load(file = "data_processed/dataComplete.RData")



