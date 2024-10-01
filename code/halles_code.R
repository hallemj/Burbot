## read in and clean burbot assessment larva data

# load dependendancies
library(tidyverse)


raw_data <- read.csv('data/Burbot_Larval Assessment.csv')

clean_data <- raw_data %>%
  group_by(REPRESENTATIVE_TRS) %>%
            summarize(count = sum(FREQUENCY))


## from chat GPT
# Install and load tidyr package if not already installed
# install.packages("tidyr")
library(tidyr)

# Sample data frame
df <- data.frame(ID = 1:3,
                 Info = c("A/B/C", "D/E/F", "G/H/I"))

# Split the "Info" column into new columns based on "/"
SuperCleanData <- separate(clean_data, REPRESENTATIVE_TRS, into = c("Township", "Range", "Section", "Section Location"), sep = "/")


# Install and load the stringr package
install.packages("stringr")  # If not installed yet
library(stringr)

SuperCleanData <- na.omit(SuperCleanData)


SuperCleanData <- SuperCleanData %>%
 mutate(Section = as.numeric(Section)) %>%
  mutate(Section = str_pad(Section, width = 2, pad = "0")) 

# Concatenate the two columns without any separator
SuperCleanData$Section <- paste0(SuperCleanData$Section, SuperCleanData$`Section Location`)

# get rid of the extra column - "section location"
SuperCleanData$`Section Location` <- NULL

# Export the entire data frame to a CSV file
write.csv(SuperCleanData, "SuperCleanBurbotData", row.names = FALSE)


