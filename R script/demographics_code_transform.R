### Data Processing Script ==================================================
##
## Transform | Demographics -------------------------------------------------

#### 0.0  Load functions -------
install.packages("tidyverse")
install.packages("dplyr")
install.packages("feather")

library(tidyverse)
library(dplyr)
library(feather)
library(stringr)

#### 1.0  Read the data -------
df0_demo <- read_feather("\\Users\\Quincy Wambui\\Desktop\\_GitRepos\\Data\\data_transformed\\dfri_df0_demo.feather")

##### Adjustment 1-
# Assigning q0_ to the start of the demographic columns
df1_demo <- df0_demo %>% 
  rename_with(.cols = -1, .fn = ~ paste0("q0_", .))

##### Adjustment 2 ----
# Assigning date data type to date of birth column
df1_demo <- df1_demo %>% 
  mutate(q0_what_is_your_date_of_birth = as.Date(q0_what_is_your_date_of_birth,format = "%d/%m/%Y"))

##### Adjustment 3 ----
# Converting all character column values to lower case for consistency
df1_demo <- df1_demo %>% 
  mutate(across(where(is.character), ~ tolower(.x)))

##### Adjustment 4 ----
# Standardizing the language column
# It has messy text data with multiple variations, misspellings, 
# abbreviations, and inconsistent formatting.

# Creating a Mapping Dictionary based on the unique values
# to map variations to standard forms. 
language_map <- list(
  "asls" = "asl",
  "asl)" = "asl",
  "asl hausa language" = "asl, hausa",
  "asl for the deaf" = "asl",
  "a.s.l and n.s.l" = "asl, nsl",
  "america sign language" = "asl",
  "asl and english and sign language" = "asl, english, sign language",
  "asl, nigeria language" = "asl, nigeria",
  "asl/nsl" = "asl, nsl",
  "berom and hausa" = "berom, hausa",
  "engl, yoruba, sign language" = "english, youruba, sign language",
  "english (asl)" = "english",
  "english and nsl" = "english, nsl",
  "english / hausa" = "english, hausa",
  "english and hausa" = "english, hausa",
  "english, hausa language" = "english, hausa",
  "english, sign language and hausa" = "english, sign language, hausa",
  "english and hausa language" = "english, hausa",
  "english and igbo languages" = "english, igbo",
  "english and sign language" = "english, sign language",
  "english and yoruba" = "english, yoruba",
  "english hausa fulani sign language" = "english, hausa, fulani, sign language",
  "english language" = "english",
  "english (sign language" = "asl",
  "english (sign language)" = "asl",
  "english language (sign language" = "asl",
  "english language (sign language)" = "asl",
  "english language and nsl" = "english, nsl",
  "english language and sign language" = "english, sign language",
  "english language and sign language and hausa" = "english, sign language, hausa",
  "english language of sign language" = "asl",
  "english language sign language hausa language" = "asl, hausa",
  "english language, sign language" = "english, sign language",
  "english language/sign language" = "english, sign language",
  "english or arabic" = "english, arabic",
  "english sign language" = "asl",
  "english sign language for the deaf" = "asl",
  "english sign languages" = "asl",
  "english tiv sign language" = "asl, tiv",
  "english yoruba nigerian sign language (nsl)" = "english, yoruba, nsl" ,
  "english, hausa , fulani" = "english, hausa, fulani",
  "english, hausa and sign language" = "english, hausa, sign language",
  "english, hausa, fulani" = "english, hausa, fulani",
  "english, sign language" = "english, sign language",
  "english, hausa, sign langauge" = "english, hausa, sign language",
  "english, yoruba" = "english, yoruba",
  "english/ hausa" = "english, hausa",
  "english/hausa" = "english, hausa" ,
  "english/nigeria" = "asl, nsl",
  "english/sign language" = "english, sign language",
  "english and sign language and hausa" = "english, sign language, hausa",
  "hausa" = "hausa",
  "english of sign language" = "asl",
  "hausa asl" = "hausa, asl",
  "hausa / english language" = "hausa, english",
  "hausa / english" = "hausa, english",
  "hausa and english" = "hausa, english",
  "hausa and english language" = "hausa, english",
  "hausa english sign language" = "hausa, asl",
  "hausa, english" = "hausa, english",
  "hausa, english and asl" = "hausa, english, asl",
  "hausa, english, and arabic" = "hausa, english, arabic",
  "hausa, fulani, and english" = "hausa, fulani, english",
  "hausa/english" = "hausa, english",
  "ibo" = "igbo",
  "language" = "language",
  "languages" = "language",
  "nigeria language" = "nsl",
  "nigeria sign language" = "nsl",
  "nigerian sign language (nsl) written in english language" = "nsl",
  "nigerian sign language (nsl) written in english" = "nsl",
  "nigerian sign language." = "nsl",
  "nigerian sign language/ see" = "nsl",
  "nsl" = "nsl",
  "nsl and english" = "nsl, english",
  "nsl and english language" = "nsl, english",
  "sign langauge, english" = "sign language, english",
  "sign langauge" = "sign language",
  "sign language" = "sign language",
  "sign language-english" = "asl",
  "sign language and english" = "sign language, english",
  "sign language communication" = "sign language",
  "sign language/english" = "sign language, english"
)

# Function to replace values based on mapping
clean_language <- function(language) {
  # Search for each unique value in the map and replace with the standard form
  for (key in names(language_map)) {
    language <- str_replace_all(language, fixed(key), language_map[[key]])
  }
  language
}

# Apply to your dataframe
df1_demo <- df1_demo %>%
  mutate(q0_languages_you_use_comfortably = clean_language(q0_languages_you_use_comfortably))
