###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################
library(dplyr)
library(readxl)
library(plotly)
library(DT)
library(shinycssloaders)
library(tidyverse)
library(readxl)
library(ggthemes)
library(colorspace)

df_covid <- read_excel("data/BaseCovidSN.xlsx", sheet = "Feuil1", range = "A1:M92")

#positve_case <- df_covid %>% select(Date,`Cas positifs`,`taux de postivité`)
#positive_rate <- positve_case$`taux de postivité` %>% mean() %>% round(., 2)
df_covid$Date <- as.Date(df_covid$Date)






set.seed(122)
df <- data.frame(
  n = rnorm(500),
  m = rnorm(100))
