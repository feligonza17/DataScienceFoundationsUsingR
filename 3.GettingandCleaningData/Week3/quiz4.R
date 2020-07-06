library(tidyverse)

base <- read.csv("3.GettingandCleaningData/Week3/getdata_data_ss06hid.csv")

library(jpeg)
library(janitor)
library(dmm)

strsplit(names(base), "wgtp")[[123]]

image <- readJPEG("3.GettingandCleaningData/Week3/getdata_jeff.jpg", native = TRUE)
quantile(image, probs = c(0.30, 0.70))

base_1 <- read.csv("3.GettingandCleaningData/Week3/getdata_data_GDP.csv")
base_2 <- read.csv("3.GettingandCleaningData/Week3/getdata_data_EDSTATS_Country.csv")


base_1 <- clean_names(base_1)

mean(as.numeric(gsub(",", "", base_1$x_3)), na.rm=T)
grep("^United", base_1$x_2)

base_3 <- merge(base_1, base_2, by.x="x", by.y = "CountryCode")
base_3 %>% arrange(desc(GDP)) %>% head(13)

base_3 %>% group_by(Income.Group) %>% summarise(mean(GDP))
table(base_3$GDP<=38, base_3$Income.Group)

