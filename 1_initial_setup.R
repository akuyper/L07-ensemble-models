# L07 Ensemble Models ----
# Initial setup: split, resamples, data checks

# load package(s)
library(tidymodels)
library(tidyverse)
library(here)

# handle common conflicts
tidymodels_prefer()

# load data
wildfires_dat <- read_csv(here("data/wildfires.csv")) |>
  janitor::clean_names() |>
  mutate(
    winddir = factor(winddir, levels = c("N", "NE", "E", "SE", "S", "SW", "W", "NW")),
    traffic = factor(traffic, levels = c("lo", "med", "hi")),
    wlf = factor(wlf, levels = c(1, 0), labels = c("yes", "no"))
  ) |>
  select(-wlf)

# Data checks ----
# Outcome/target variable


# check missingness & look for extreme issues


# Initial split & folding ----
set.seed(PICK A VALUE)
wildfires_split <-
  wildfires_dat |>
  initial_split(prop = 0.75, strata = burned)

wildfires_train <- training(wildfires_split)
wildfires_test <- testing(wildfires_split)

# folds
set.seed(PICK A VALUE)
wildfires_folds <-
  wildfires_train
  vfold_cv(v = 5, repeats = 3, strata = burned)

# objects required for tuning
# data objects
save(wildfires_folds, file = here("L07-ensemble-models/data/wildfires_folds.rda"))
save(wildfires_split, file = here("L07-ensemble-models/data/wildfires_split.rda"))
save(wildfires_train, file = here("L07-ensemble-models/data/wildfires_train.rda"))
save(wildfires_test, file = here("L07-ensemble-models/data/wildfires_test.rda"))

