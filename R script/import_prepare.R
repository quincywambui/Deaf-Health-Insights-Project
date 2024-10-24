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
