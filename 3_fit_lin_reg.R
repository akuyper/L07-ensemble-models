# L07 Ensemble Models ----
# Fit linear regression model

# Load package(s) ----
library(tidyverse)
library(tidymodels)
library(here)

# Handle common conflicts
tidymodels_prefer()

# load required objects ----
load("recipes/wildfires_recipe.rda")
load("data/wildfires_folds.rda")

# model specification ----
lin_reg_spec <-
  linear_reg() |>
  set_mode("regression")
  set_engine("lm")

# workflow ----
lin_reg_wflow <-
  workflow() |>
  add_model(lin_reg_spec) |>
  add_recipe(wildfires_recipe)

# Tuning/fitting ----
lin_reg_res <- lin_reg_wflow |>
  fit_resamples(
    resamples = wildfires_folds,
    # NEED TO ADD AN ARGUMENT HERE
    )

# Write out results & workflow
save(lin_reg_res, file = here("results/lin_reg_res.rda"))


