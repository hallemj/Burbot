## read in and clean burbot assessment larva data

# load dependendancies
library(tidyverse)


raw_data <- read.csv('data/Burbot_Larval Assessment.csv')

clean_data <- raw_data %>%
  group_by(REPRESENTATIVE_TRS) %>%
            summarize(count = sum(FREQUENCY))
