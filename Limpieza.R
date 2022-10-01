
library(readxl)
data <- read_excel("saludmental_v2.xlsx")

data <- data %>% 
  mutate(
    age_cat = case_when(
      age <= 30 ~ "Joven",
      age <= 50 ~ "Adulto",
      TRUE ~ "Adulto Mayor" # Todos los demás
    )
  )