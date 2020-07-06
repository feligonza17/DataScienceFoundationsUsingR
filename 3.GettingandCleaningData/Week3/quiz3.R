library(tidyverse)

base <- read.csv("3.GettingandCleaningData/Week3/getdata_data_ss06hid.csv")

agricultureLogical <- base %>% filter(ACR=="3" & AGS=="6")

which((base[,"ACR"]=="3" & base[,"AGS"]=="6"))


library(jpeg)
library(janitor)
library(dmm)

image <- readJPEG("3.GettingandCleaningData/Week3/getdata_jeff.jpg", native = TRUE)
quantile(image, probs = c(0.30, 0.70))

base_1 <- read.csv("3.GettingandCleaningData/Week3/getdata_data_GDP.csv")
base_2 <- read.csv("3.GettingandCleaningData/Week3/getdata_data_EDSTATS_Country.csv")



base_1 <- clean_names(base_1)
base_1 <- base_1 %>% 
  filter(gross_domestic_product_2012!="") %>% 
  filter(x!="") %>% 
  mutate(GDP=unfactor(gross_domestic_product_2012))


base_3 <- merge(base_1, base_2, by.x="x", by.y = "CountryCode")
base_3 %>% arrange(desc(GDP)) %>% head(13)

base_3 %>% group_by(Income.Group) %>% summarise(mean(GDP))
table(base_3$GDP<=38, base_3$Income.Group)

