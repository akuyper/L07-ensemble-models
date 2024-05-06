# L07 Ensemble Models ----
# Train & explore ensemble model

# Load package(s) ----
library(tidymodels)
library(tidyverse)
library(here)
library(stacks)

# Handle common conflicts
tidymodels_prefer()

# Load candidate model info ----
load(here("results/knn_res.rda"))
load(here("results/svm_res.rda"))
load(here("results/lin_reg_res.rda"))

# Create data stack ----


# Fit the stack ----
# penalty values for blending (set penalty argument when blending)
blend_penalty <- c(10^(-6:-1), 0.5, 1, 1.5, 2)

# Blend predictions (tuning step, set seed)
set.seed(SET A SEED)


# Save blended model stack for reproducibility & easy reference (for report)


# Explore the blended model stack


# fit to training set ----


# Save trained ensemble model for reproducibility & easy reference (for report)


