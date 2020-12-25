###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################
library(dplyr)
library(readxl)

df_covid <- read_excel("data/BaseCovidSN.xlsx", sheet = "Feuil1", range = "A1:M92")

positve_case <- df_covid %>% select(Date,`Cas positifs`,`taux de postivité`)
positive_rate <- positve_case$`taux de postivité` %>% mean() %>% round(., 2)



set.seed(122)
df <- data.frame(
  n = rnorm(500),
  m = rnorm(100))
