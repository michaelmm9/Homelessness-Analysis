

library(tidycensus)
library(tidyverse)

census_api_key("bc82d02d37a5034046c8d47f56e5cbf5998a4c19", install = T)

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
