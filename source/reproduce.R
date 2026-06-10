if (!"renv" %in% rownames(installed.packages())) {
  install.packages("renv")
}

# restore specific R package versions
renv::restore()

# install cmdstan
cmdstanr::install_cmdstan(version = "2.38.0", overwrite = FALSE)

# check if pandoc is available
if (!rmarkdown::pandoc_available()) {
  cat("Please install a recent pandoc version")
}

# download the zenodo deposit (dataset)
library(inborutils)
library(frictionless)
library(here)

inborutils::download_zenodo(
  doi = "10.5281/zenodo.10527033",
  path = here("data")
)

# unzip
utils::unzip(here("data", "data_packages.zip"), exdir = here("data"))


# knit the Rmarkdown file containing the supplementary material
# this will take a while the first time (1-2 hours)
# model objects are saved as rds files and the report will be rendered to html
# the latter will be saved in a folder ./output
if (!dir.exists(here::here("output"))) {
  dir.create(here::here("output"))
}

rmarkdown::render(
  input = here::here("source", "schoolyard_microbiome_health.Rmd"),
  output_dir = here::here("output")
  )
