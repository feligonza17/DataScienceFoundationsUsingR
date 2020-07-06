base <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "3.GettingandCleaningData/Week1/base_datos.csv", method = "internal")

base <- read.csv("3.GettingandCleaningData/Week1/getdata_data_ss06hid.csv")

table(base$VAL)

base$FES
library(readxl)

dat <- read_xlsx("3.GettingandCleaningData/Week1/getdata_data_DATA.gov_NGAP.xlsx", range = "G18:O23")
dat <- dat[18:23, 7:15]
