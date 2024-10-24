## Data Processing Script ==================================================
##
## Import & Prepare -------------------------------------------------
##
## This script plays a role in acquiring raw survey data file and performing 
## pre-processing tasks, ensuring the data is optimized at subsequent stages 
## of processing. This script handles tasks such as data cleaning, 
## feature engineering and column format adjustments.

#### 1.0  Read the data -------
df0_deaf <- readxl::read_xlsx("\\Users\\Quincy Wambui\\Desktop\\_GitRepos\\Data\\Deaf Community Research Nigeria Data for Viz for Social Good V.2.xlsx")

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


# Rename columns
df2_deaf <- df1_deaf %>% 
  rename(
    "languages" = "languages you use comfortably",
    "date of birth"= "what is your date of birth?",
    "contact method" = "best contact method for communication",
    "tribe" = "which tribal affiliation do you identify with?",
    "religion" = "which religion do you follow?",
    "sexual orientation" = "do you identify as queer, gay, bisexual, lesbian, transgender, or asexual?",
    "relationship status" = "describe your relationship status",
    "partner deaf status" = "is your partner deaf?",
    "occupation status" = "current occupation status",
    "job type" = "what kind job do you have?",
    "salary" = "how much money do you earn a month? (salary) [it is in niara currency]",
    "number of jobs" = "how many jobs do you have?",
    "days per week worked" = "how many days a week do you work?",
    "yearly rent or mortgage" = "how much do you pay yearly for rent or mortage?",
    "house ownership" = "do you own a house?",
    "access to clean water" = "do you have access to clean water?",
    "access to wash hands" = "do you have access to wash your hands?",
    "enough to eat" = "do you feel like you have enough to eat?",
    "diet supports health needs" = "do you feel that what you eat supports your health needs?",
    "frequency fresh fruit or vegetables" = "- how often do you eat fresh fruit or vegetables?",
    "is healthy food expensive" = "is healthy food expensive?",
    "lack of transportation for healthy food" = "why are you not eating healthy foods? - i don't have the transportation to go shopping for healthy food",
    "lack of time for healthy food preparation" = "why are you not eating healthy foods? - i don't have the time to shop for, and prepare healthy food",
    "lack of cooking knowledge for healthy meals" = "why are you not eating healthy foods? - i don't know how to cook and prepare healthy meals",
    "why are you not eating healthy foods? - i don't have the supplies and equipment i'd need to cook healthy food" = 
    
  )

#### 2.0  Exploratory Data Analysis -------

##### 2.1  Demographics  -------
# Gender/Sex
df1_deaf %>%
  group_by(sex) %>% 
  summarise(N = n())

# 
