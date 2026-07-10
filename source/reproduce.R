# We assume you have a local clone of
# https://github.com/inbo/schoolyard-microbiome-health.git
# and your working directory should be the folder containing the
# schoolyard-microbiome-health.Rproj file.
# If you are using RStudio and started the project by opening this file with
# RStudio, your working directory will be correct.
# For instructions on how to clone a repository, see
# https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository


if (!"renv" %in% rownames(installed.packages())) {
  install.packages("renv")
}

# restore specific R package versions
options(renv.config.pak.enabled = TRUE)
renv::restore()

# install cmdstan
cmdstanr::install_cmdstan(version = "2.38.0", overwrite = FALSE)

# check if pandoc is available
if (!rmarkdown::pandoc_available()) {
  cat("Please install a recent pandoc version")
}

# check working directory
library(here)
stopifnot(file.exists(here("schoolyard-microbiome-health.Rproj")))

# download the zenodo deposit (dataset)
library(frictionless)
source(here("source", "download_zenodo.R"))

download_zenodo(
  doi = "10.5281/zenodo.10527033",
  path = here("data")
)

# unzip
utils::unzip(here("data", "data_packages.zip"), exdir = here("data"))


# knit the Rmarkdown file containing the supplementary material
# this will take a while the first time (1-2 hours)
# model objects are saved as rds files and the report will be rendered to html
# the latter will be saved in a folder ./output
if (!dir.exists(here("output"))) {
  dir.create(here("output"))
}

rmarkdown::render(
  input = here("source", "schoolyard_microbiome_health.Rmd"),
  output_dir = here("output")
)

rmarkdown::render(
  input = here("source", "extra_microbiome_analysis.Rmd"),
  output_dir = here("output")
)
