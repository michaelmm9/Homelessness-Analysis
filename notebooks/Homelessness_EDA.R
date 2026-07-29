

library(tidycensus)
library(tidyverse)


Sys.getenv("CENSUS_API_KEY")

acs <- get_acs(
  geography = "county",
  year = 2023,
  survey = "acs5",
  variables = c(
    population = "B01003_001",
    median_income = "B19013_001",
    median_rent = "B25064_001",
    median_home_value = "B25077_001"
  )
)

head(acs)

acs_wide <- acs %>%
  select(-moe) %>%
  pivot_wider(., names_from = variable, values_from = estimate)

hist(acs_wide$median_income, main = "Histogram of Median Income", xlab = "Median Income", col = "lightblue", border = "black")
