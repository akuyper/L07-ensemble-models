# L07 Ensemble Models ----
# Tune KNN model

# Load package(s) ----
library(tidyverse)
library(tidymodels)
library(here)

# Handle common conflicts
tidymodels_prefer()

# parallel processing ----


# load required objects ----
load(here("recipes/wildfires_recipe.rda") )
load(here("data/wildfires_folds.rda") )

# model specification ----
knn_spec <-
  nearest_neighbor(
    neighbors = tune()
  ) |>
  set_mode("regression")
  set_engine("kknn")

# # check tuning parameters
# hardhat::extract_parameter_set_dials(knn_spec)

# set-up tuning grid ----
knn_params <- hardhat::extract_parameter_set_dials(knn_spec) |>
  update(neighbors = neighbors(range = c(1,40)))

# define grid
knn_grid <- grid_regular(knn_params, levels = 15)

# workflow ----
knn_wflow <-
  workflow() |>
  add_model(knn_spec) |>
  add_recipe(wildfires_recipe)

# Tuning/fitting ----
set.seed(SET A SEED)
knn_res <-
  knn_wflow |>
  tune_grid(
    resamples = wildfires_folds,
    grid = knn_grid,
    # NEED TO ADD AN ARGUMENT HERE
  )

# Write out results & workflow
save(knn_res, file = here("results/knn_res.rda") )
