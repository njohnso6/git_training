
# Analysis of WIC dollars spent

# The datasets used here may include participation data and spending for state
# programs, and poverty data for each state. Data for WIC covers fiscal years 
# 2013-2016, which is actually October 2012 through September 2016. 
# Data for SNAP covers 2015 to 2020.
# 
# The dataset was taken from https://www.kaggle.com/jpmiller/publicassistance

library(dplyr)
library(readr)
library(tidyr)


# Here we make the column names easier
# agency: the local agency where this was done. e.g. Jemez Pueblo, NM
# avg_part: average particpation across all months
headr <- c('agency', 'oct', 'nov', 'dec', 'jan', 'feb', 'mar', 'apr', 'may', 
           'jun', 'jul', 'aug', 'sept', 'avg_part')

# Here we load all the datasets we are going to use
ful_b_13 <- read_csv('archive/old_fldr_jvci653876/Infants_Fully_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully breastfed infants 2013
ful_f_13 <- read_csv('archive/old_fldr_jvci653876/Infants_Fully_Formula-fed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully formula-fed infants 2013
par_b_13 <- read_csv('archive/old_fldr_jvci653876/Infants_Partially_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # partially breastfed infants 2013
tot_w_13 <- read_csv('archive/old_fldr_jvci653876/Total_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of participating women 2013
tot_b_w_13 <- read_csv('archive/old_fldr_jvci653876/Total_Breastfeeding_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of breastfeeding women 2013
ful_b_w_13 <- read_csv('archive/old_fldr_jvci653876/Women_Fully_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of fully breastfeeding women 2013
par_b_w_13 <- read_csv('archive/old_fldr_jvci653876/Women_Partially_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of partially breastfeeding women 2013

ful_b_14 <- read_csv('archive/old_fldr_jvci837081/Infants_Fully_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully breastfed infants 2014
ful_f_14 <- read_csv('archive/old_fldr_jvci837081/Infants_Fully_Formula-fed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully formula-fed infants 2014
par_b_14 <- read_csv('archive/old_fldr_jvci837081/Infants_Partially_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # partially breastfed infants 2014
tot_w_14 <- read_csv('archive/old_fldr_jvci837081/Total_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of participating women 2014
tot_b_w_14 <- read_csv('archive/old_fldr_jvci837081/Total_Breastfeeding_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of breastfeeding women 2014
ful_b_w_14 <- read_csv('archive/old_fldr_jvci837081/Women_Fully_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of fully breastfeeding women 2014
par_b_w_14 <- read_csv('archive/old_fldr_jvci837081/Women_Partially_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of partially breastfeeding women 2014


ful_b_15 <- read_csv('archive/old_fldr_jvci307512/Infants_Fully_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully breastfed infants 2015
ful_f_15 <- read_csv('archive/old_fldr_jvci307512/Infants_Fully_Formula-fed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully formula-fed infants 2015
par_b_15 <- read_csv('archive/old_fldr_jvci307512/Infants_Partially_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # partially breastfed infants 2015
tot_w_15 <- read_csv('archive/old_fldr_jvci307512/Total_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of participating women 2015
tot_b_w_15 <- read_csv('archive/old_fldr_jvci307512/Total_Breastfeeding_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of breastfeeding women 2015
ful_b_w_15 <- read_csv('archive/old_fldr_jvci307512/Women_Fully_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of fully breastfeeding women 2015
par_b_w_15 <- read_csv('archive/old_fldr_jvci307512/Women_Partially_Breastfeeding.csv',
                    col_names=headr, skip=1) %>% 
                    drop_na('dec') # Number of partially breastfeeding women 2015

ful_b_16 <- read_csv('archive/old_fldr_jvci098761/Infants_Fully_Breastfed.csv',
                     col_names=headr, skip=1) %>%
                     drop_na('dec') # fully breastfed infants 2016
ful_f_16 <- read_csv('archive/old_fldr_jvci098761/Infants_Fully_Formula-fed.csv',
                     col_names=headr, skip=1) %>% 
                     drop_na('dec') # fully formula-fed infants 2016
par_b_16 <- read_csv('archive/old_fldr_jvci098761/Infants_Partially_Breastfed.csv',
                     col_names=headr, skip=1) %>% 
                     drop_na('dec') # partially breastfed infants 2016
tot_w_16 <- read_csv('archive/old_fldr_jvci098761/Total_Women.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of participating women 2016
tot_b_w_16 <- read_csv('archive/old_fldr_jvci098761/Total_Breastfeeding_Women.csv',
                    col_names=headr, skip=1) %>% 
                    drop_na('dec') # Number of breastfeeding women 2016
ful_b_w_16 <- read_csv('archive/old_fldr_jvci098761/Women_Fully_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of fully breastfeeding women 2016
par_b_w_16 <- read_csv('archive/old_fldr_jvci098761/Women_Partially_Breastfeeding.csv',
                    col_names=headr, skip=1) %>%
                    drop_na('dec') # Number of partially breastfeeding women 2016

# Tibbles
rows <- tot_b_w_13 %>% select('agency')
tot_b_w_13 <- tot_b_w_13 %>% select(-c('agency'))
ful_b_13   <- ful_b_13   %>% select(-c('agency'))
breast_fed_babies_per_w <- as_tibble(ful_b_13 / tot_b_w_13)
cbind(rows, result)

# Dataframe
tot_b_w_13_d <- as.data.frame(tot_b_w_13)
ful_b_13_d   <- as.data.frame(ful_b_13)
breast_fed_babies_per_w_2 <- ful_b_13_d / tot_b_w_13_d

