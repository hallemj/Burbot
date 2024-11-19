## read in and clean burbot assessment larva data

# load dependencies ----
library(tidyverse)
# stringr and tidyr are a part of tidyverse so you only need to load tidyverse


raw_data <- read.csv('data/Burbot_Larval Assessment.csv')


# clean and wrangle data for joining to MI PLSS data.  Just count and TRS ----
clean_data <- raw_data %>%
  group_by(REPRESENTATIVE_TRS, Year) %>%
  
  summarize(count = sum(FREQUENCY)) %>%
  separate(REPRESENTATIVE_TRS, 
           into = c("Township", "Range", "Section", "Section Location"), 
           sep = "/") %>%
  mutate(Section = as.numeric(Section)) %>%
  mutate(Section = str_pad(Section, width = 2, pad = "0")) %>%
  na.omit() %>%
  mutate(TWNRNSEC = paste0(Township, Range, Section))



# Export the entire data frame to a CSV file
write.csv(clean_data, "data/clean_data.csv", row.names = FALSE)

<<<<<<< HEAD
=======
<<<<<<< HEAD


>>>>>>> ccc4ba345b5c6046b3c4d187a8f88c0398288b65


clean_data_year <- raw_data %>%
  group_by(REPRESENTATIVE_TRS, Year) %>%
  summarize(count = sum(FREQUENCY)) %>%
  separate(REPRESENTATIVE_TRS, 
           into = c("Township", "Range", "Section", "Section Location"), 
           sep = "/") %>%
  mutate(Section = as.numeric(Section)) %>%
  mutate(Section = str_pad(Section, width = 2, pad = "0")) %>%
  na.omit() %>%
  mutate(TWNRNSEC = paste0(Township, Range, Section))


<<<<<<< HEAD

# Export the entire data frame to a CSV file
write.csv(clean_data_year, "data/clean_data.csv", row.names = FALSE)


=======
# Export the entire data frame to a CSV file
write.csv(clean_data_year, "data/clean_data.csv", row.names = FALSE)

=======
>>>>>>> d4d140ccf3b905274c9e94c9233d65f0777234a4
>>>>>>> ccc4ba345b5c6046b3c4d187a8f88c0398288b65
