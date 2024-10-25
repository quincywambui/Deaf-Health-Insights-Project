## Data Processing Script ==================================================
##
## Import & Prepare -------------------------------------------------
##
## This script plays a role in acquiring raw survey data file and performing 
## pre-processing tasks, ensuring the data is optimized at subsequent stages 
## of processing. This script handles tasks such as data cleaning, 
## feature engineering and column format adjustments.

#### 0.0  Load functions -------
install.packages("tidyverse")
install.packages("dplyr")
install.packages("janitor")
install.packages("feather")

library(tidyverse)
library(dplyr)
library(janitor)
library(feather)
#### 1.0  Read the data -------
df0_deaf <- readxl::read_xlsx("\\Users\\Quincy Wambui\\Desktop\\_GitRepos\\Data\\data_imported\\Deaf Community Research Nigeria Data for Viz for Social Good V.2.xlsx")

#### 1.1  Check the data -------
df1_deaf <- df0_deaf %>% 
  # Apply snake_case column naming convention
  janitor::clean_names()


### 2.0  Create different tables for different sections of the survey data -------
##### 2.1  Demographics -------
df0_demo <- df1_deaf %>%
  select(1:10)

##### 2.2  Occupation and Education -------
df0_emp <- df1_deaf %>% 
  select(1, 11:16)

##### 2.3  Housing and Living conditions -------
df0_house <- df1_deaf %>% 
  select(1, 17:20, 50)

##### 2.4  Food Access and Nutrition -------
df0_food <- df1_deaf %>% 
  select(1, 21:31)

##### 2.5  Access to technology -------
df0_tech <- df1_deaf %>%
  select(1, 32:33)

##### 2.6  Quality of Life and Satisfaction -------
df0_qol <- df1_deaf %>%
  select(1, 34:44, 47:48)

##### 2.7  Health Access and Healthcare -------
df0_health <- df1_deaf %>%
  select(1, 45:46, 49, 99:100, 87:88)

##### 2.8  Relationships and social support -------
df0_relationship <- df1_deaf %>%
  select(1, 52:54)

##### 2.9  Transportation -------
df0_transport <- df1_deaf %>%
  select(1, 51, 80)

##### 2.10  Adverse Experiences(Trauma and Violence) -------
df0_adverse <- df1_deaf %>%
  select(1, 56:62)

##### 2.11  Hearing Loss and Support -------
df0_loss <- df1_deaf %>%
  select(1, 63:79)

##### 2.12  Accessiblity and Communication Support -------
df0_communication <- df1_deaf %>%
  select(1, 81:86, 101:103, 108)

##### 2.13  Health Disorders and Protection -------
df0_disorders <- df1_deaf %>%
  select(1, 89:98)

##### 2.14  Crisis and Emergency Preparedness -------
df0_crisis <- df1_deaf %>%
  select(1, 55, 104:107)

##### 3.0  Write dataframes to feather files ------
arg_loc <- "\\Users\\Quincy Wambui\\Desktop\\_GitRepos\\Data\\data_transformed"

fn_write_df_to_feather <- function(arg_df, arg_loc){
  # This function writes a data frame to a Feather file with a specific file path 
  # constructed based on various arguments.
  
  # This function is designed to save data in Feather format for efficient storage 
  # and exchange in data processing workflows.
  
  # Arguments:
  # --- arg_df: the data frame to be written to a Feather file
  # --- arg_loc: the location where the Feather file will be saved
  
  # Get the name of the dataframe as a string
  df_name <- deparse(substitute(arg_df))
  
  tmp_path <- paste0(
    arg_loc,
    "\\",
    paste("dfri", df_name, sep="_"),
    ".feather"
  )
  
  feather::write_feather(x = arg_df, path = tmp_path)
  
}

#####3.1 Export files -----

# Demographics
fn_write_df_to_feather(df0_demo,arg_loc)

# Occupation and Education
fn_write_df_to_feather(df0_emp,arg_loc)

# Housing and Living conditions
fn_write_df_to_feather(df0_house,arg_loc)

# Food Access and Nutrition
fn_write_df_to_feather(df0_food,arg_loc)

# Access to technology
fn_write_df_to_feather(df0_tech,arg_loc)

# Quality of Life and Satisfaction
fn_write_df_to_feather(df0_qol,arg_loc)

# Health Access and Healthcare
fn_write_df_to_feather(df0_health,arg_loc)

# Relationships and social support
fn_write_df_to_feather(df0_relationship,arg_loc)

# Transportation
fn_write_df_to_feather(df0_transport,arg_loc)

# Adverse Experiences(Trauma and Violence)
fn_write_df_to_feather(df0_adverse,arg_loc)

# Hearing Loss and Support
fn_write_df_to_feather(df0_loss,arg_loc)

# Accessibility and Communication Support
fn_write_df_to_feather(df0_communication,arg_loc)

# Health Disorders and Protection
fn_write_df_to_feather(df0_disorders,arg_loc)

# Crisis and Emergency Preparedness
fn_write_df_to_feather(df0_crisis,arg_loc)







