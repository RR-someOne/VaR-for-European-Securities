# The original dataset contains around 1000 observations. There is one response and twenty explantory variables. Logistic regression classifies outcomes as either "good" credit or "bad" credit. Dataset source is from the German Credit Dataset. All variables are either numeric or categorical.

install.packages("ggmosaic")
install.packages("gridExtra")
install.packages("ggpubr")
install.packages("reshape")
install.packages("Amelia")
install.packages("ROSE")
install.packages("polycor")
install.packages("ggcorrplot")
install.packages("dplyr")

# File can be downloaded from UCI datastore. New path can be created.
PATH = "PATH"
German_Credit <- read.csv(PATH, ,header = T, sep = ",")

library(ggplot2)
library(gridExtra)
library(ggpubr)
install.packages("devtools")
devtools::install_github("haleyjeppson/ggmosaic")
library(reshape)
library(Amelia)
library(ROSE)
library(polycor)
library(ggcorrplot)
library(dplyr)
library(formattable)

colnames(German_Credit) <- c()
colnames(German_Credit) <- c("CheckingStatus", "Duration", "CreditHistory", "Purpose", "CreditAmount", "SavingsStatus", "Employment", "InstallmentRate", "PersonalStatus", "OtherParties", "ResidenceDuration", "PropertyMagnitude", "Age", "OtherPaymentPlans", "Housing", "ExistingCredits", "Job", "NumDependents", "Telephone", "ForeignWorker", "Class")


German_Credit$Purpose <- factor(German_Credit$Purpose,
                                 levels = c("A40", "A41", "A42", "A43", "A44", "A45", "A46", "A47", "A48", "A49", "A410"),
                                 labels = c("car", "car (used)", "furniture/equipment", "radio/television", "domestic appliances", "repairs", "education", "vacation", "retraining", "business", "others"))

German_Credit$SavingsStatus <- factor(German_Credit$SavingsStatus,
                                     levels = c("A61", "A62", "A63", "A64", "A65"),
                                     labels = c("< 100 DM", "100 <= ... <500 DM", "500 <= ... <1000 DM", "more than 1000 DM", "no savings account"))

German_Credit$Employment <- factor(German_Credit$Employment,
                                  levels = c("A71", "A72", "A73", "A74", "A75"),
                                  labels = c("unemployed", "less than 1 year", "1 <= ... <4 years", "4 <= ... < 7 years", "more than 7 years"))

German_Credit$PersonalStatus <- factor(German_Credit$PersonalStatus,
                                      levels = c("A91", "A92", "A93", "A94", "A95"),
                                      labels = c("male: divorced/separated", "female: divorced/separated/married", "male: single", "male: married/widowed", "female: single"))

German_Credit$OtherParties <- factor(German_Credit$OtherParties,
                                    levels = c("A101", "A102", "A103"),
                                    labels = c("none", "co-applicant", "guarantor"))

German_Credit$PropertyMagnitude <- factor(German_Credit$PropertyMagnitude,
                                         levels = c("A121", "A122", "A123", "A124"),
                                         labels = c("real estate", "building society savings agreement", "car or other", "no properties"))

German_Credit$OtherPaymentPlans <- factor(German_Credit$OtherPaymentPlans,
                                         levels = c("A141", "A142", "A143"),
                                         labels = c("bank", "stores", "none"))

German_Credit$Housing <- factor(German_Credit$Housing,
                               levels = c("A151", "A152", "A153"),
                               labels = c("rent", "own", "for free"))

German_Credit$Job <- factor(German_Credit$Job,
                           levels = c("A171", "A172", "A173", "A174"),
                           labels = c("unemployed/ unskilled - non-resident", "unskilled - resident", "skilled employee/official", "management/self-employed/highly qualified"))

German_Credit$Telephone <- factor(German_Credit$Telephone,
                                 levels = c("A191", "A192"),
                                 labels = c("none", "yes"))

German_Credit$ForeignWorker <- factor(German_Credit$ForeignWorker,
                                     levels = c("A201", "A202"),
                                     labels = c("yes", "no"))


German_Credit$CheckingStatus <- factor(German_Credit$CheckingStatus,
                                     levels = c("A11", "A12", "A13", "A14"),
                                     labels = c("less than 0 DM", "0-200 DM", "more than 200 DM", "no checking account"))

German_Credit$CreditHistory <- factor(German_Credit$CreditHistory,
                                    levels = c("A30", "A31", "A32", "A33", "A34"),
                                    labels = c("no credits taken", "all credits at this bank paid back duly", "existing credits paid back duly till now", "delay in paying off in the past", "critical account"))

grid.arrange(p2, p4, ncol=2)
options(repr.plot.width = 10, repr.plot.height = 8)

## Checking Accounts

DM - Deutsche Mark Currency 

Status of checking accounts a big majority shows "good" credit as having zero checking accounts. Bad credit on checking accounts shows no checking accounts are a mintority which is expected. Less than zero DM and 0 - 200 are close to even. 




## Savings Accounts

Good credit on savings accounts, there is a large chunk that have no savings accounts. The savings accounts related to bad credit < 100 DM takes up a large majority. Checkings account with arount half of the userbase seem to have access to no checking accounts compared to around 25% of savings accounts of user access. These results are show the data presumes users with no savings/less DM value per savings account have a better credit score than other users which may be misleading.

table_c_p <- as.data.frame(count(group_by(German_Credit, CheckingStatus, Purpose)))
colnames(table_c_p) <- c( "Status of checking account", "Purpose","Freq")

tab1 <- table_c_p %>% formattable()
tab1

# Majority of loans offered are of car loans for each sub category and furniture and equipment. 

summary(German_Credit$CreditAmount)
summary(German_Credit$Duration)

# Summaries of Credit Amount and Duration
summary(German_Credit$CreditAmount)
summary(German_Credit$Duration)

# Histograms for Credit Amount and Duration
hist_credit <- ggplot(data = German_Credit, aes(CreditAmount)) + geom_histogram(breaks=seq(0, 13000, by=500),
    col="blue", 
    aes(fill=..count..)) +
    scale_fill_gradient("Count", low="cyan", high="cyan4")
  
hist_duration <- hist(German_Credit$Duration, main="Distribution of Duration", xlab="Duration")

# Arrange plots side by side
grid.arrange(plot(hist_credit), plot(hist_duration), ncol=2)