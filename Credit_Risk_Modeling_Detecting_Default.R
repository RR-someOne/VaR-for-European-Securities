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