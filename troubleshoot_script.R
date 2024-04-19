# Research analysis trouble shooting 
setwd("C:/Users/sanoj/Desktop/Bioinformatics & Data Science/R/R Project/troubleshoot")
# library
library(ggplot2)
library(gridExtra)



# A really basic boxplot.
ggplot(convergence_test, aes(x=as.factor("ABCD"))) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("Trials")



ts <- master_lenght_file
# basic scatterplot
ggplot(ts, aes(x=c1_d3_s1_wt_t1, y=c1_d3_s1_wt_t2)) + 
  geom_point()
# scatterplot
plot(x=ts$c1_d3_s1_wt_t1, y=ts$c1_d3_s1_wt_t2)
