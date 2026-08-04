<!-- badges: start -->
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21296003.svg)](https://doi.org/10.5281/zenodo.21296003)
[![website](https://img.shields.io/badge/website-https://www.uantwerpen.be/nl/projecten/baseball/-c04384)](https://www.uantwerpen.be/nl/projecten/baseball/)
![Language: en-GB](https://img.shields.io/badge/language-en--GB-c04384)
[![CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-brightgreen)](https://raw.githubusercontent.com/inbo/citeme/refs/heads/main/inst/licenses/cc_by_4_0.md)
![version: 0.3.0](https://img.shields.io/badge/version-0.3.0-c04384)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Release](https://img.shields.io/github/release/inbo/schoolyard-microbiome-health.svg)](https://github.com/inbo/schoolyard-microbiome-health/releases)
![GitHub Workflow Status](https://github.com/inbo/schoolyard-microbiome-health/actions/workflows/check_project.yml/badge.svg)
![GitHub repo size](https://img.shields.io/github/repo-size/inbo/schoolyard-microbiome-health)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/inbo/schoolyard-microbiome-health.svg)
<!-- badges: end -->

# Repository for _Environmental bacteria link green schoolyards to better child well-being and fewer allergy symptoms._

[Van Calster, Hans![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-8595-8426)[^aut][^cre][^INBO];
[Lommelen, Els![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-3481-5684)[^aut][^INBO];
[Smets, Wenke![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-5611-6094)[^aut][^UnoA];
[Research Institute for Nature and Forest (INBO)](mailto:info%40inbo.be)[^pbl][^cph];
[BELSPO](mailto:no-reply%40belspo.be)[^fnd]


[^aut]: author
[^cph]: copyright holder
[^cre]: contact person
[^ctb]: contributor
[^fnd]: funder
[^INBO]: Research Institute for Nature and Forest (INBO)
[^pbl]: publisher
[^rev]: reviewer
[^UnoA]: University of Antwerp

**keywords**:  environmental health; allergy; well-being; reproducible research; microbiome; rhinitis; wheezing; eczema; biodiversity; greening

<!-- community: inbo -->

## Contents

- [Overview](#overview)
- [Repo contents](#repo-contents)
- [System Requirements](#system-requirements)
- [Installation guide](#installation-guide)
- [Instructions to reproduce](#instructions-to-reproduce)
- [Acknowledgements](#acknowledgements)

## Overview

<!-- description: start -->
This repository contains code and supplementary data to reproduce the analyses from the paper: Smets et al. (2026). Environmental bacteria link green schoolyards to better child well-being and fewer allergy symptoms. in review at Nature Communications.
<!-- description: end -->


## Repo contents

The repository has the following folder structure.
Folders marked with a `*` (and their subfolders) will only be created locally after following the [Installation guide](#installation-guide) and [Instructions to reproduce](#instructions-to-reproduce).

```
.
├── data
│   ├── datapackage_an_zenodo_cleaned_data*
│   ├── datapackage_an_zenodo_derived_data*
│   └── micdata
│       ├── environ
│       └── skin
├── media
├── output
│   ├── extra_microbiome_analyses_files*
│   │   └── figure-html
│   └── schoolyard_microbiome_health_files*
│       └── figure-html
├── renv
│   ├── library*
│   │   └── windows
│   └── staging*
└── source
    ├── data_objects_paper*
    ├── extra_microbiome_analyses_cache*
    │   ├── 4810986495ca50668878845a26062174
    │   ├── 4b5323c36f2822a8699b0791ed3c8ed6
    │   ├── 866821cf7c81f54d0f6473b5f87e20db
    │   └── html
    ├── model_objects_paper*
    ├── schoolyard_microbiome_health_cache*
    │   └── html
    └── schoolyard_microbiome_health_files*
        └── figure-html
```

## System requirements

Software dependencies:

-   R programming language (version 4.6+) (+ Rtools 45 on Windows)
-   Git
-   CmdStan
-   RStudio (optional)
-   pandoc (RStudio ships with a bundled pandoc version)

The R packages used and their versions to reproduce the analyses are listed in the `renv.lock` file.
They will be installed when following the instructions in `source/reproduce.R`.

These analyses were run on a laptop with the following specifications:

-   Operating system: Windows 11 x64 (build 26200)
-   system: x86_64, mingw32
-   CPU: 13th Gen Intel(R) Core(TM) i5-1335U
-   RAM: 16 Gb


## Installation guide

We assume you have a local clone of <https://github.com/inbo/schoolyard-microbiome-health.git> and your working directory should be the folder containing the `schoolyard-microbiome-health.Rproj` file.
If you are using RStudio and started the project by opening this file with RStudio, your working directory will be correct.
For instructions on how to clone a repository, see <https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository>.

If you are using the Windows operating system, please also install Rtools 4.5.
See <https://cran.r-project.org/bin/windows/Rtools/rtools45/rtools.html> for installation instructions.

To install RStudio (optional): see <https://docs.posit.co/ide/user/#rstudio-ide-oss-downloads>.

To install pandoc (not needed if you already installed RStudio): see <https://pandoc.org/installing.html>.

To install R packages and CmdStan, follow instructions in the R script located at `source/reproduce.R` (Lines 1 - 29).

Installing all of the above on a fresh system will take about an hour.

## Instructions to reproduce

The `source/reproduce.R` file contains instructions to obtain the data (Lines 30-45) that are not already included with the local clone of <https://github.com/inbo/schoolyard-microbiome-health.git>.

The same file, `source/reproduce.R`, also contains code to render two `Rmarkdown` files to `html` output (Lines 46 - 65).
The `Rmarkdown` files (`source/schoolyard_microbiome_health.Rmd` and `source/extra_microbiome_analyses.Rmd`) contain the R source code to reproduce the analyses.
The `html` output files will be written to the `output` folder.
Rendering both files can take a long time (up to 8 hours).
Some of the computationally more heavy calculation will be cached on first run such that subsequent runs take less time.
Instead of rendering the Rmarkdown files, the R code contained in the Rmarkdown files can also be run interactively from the R chunks.

## Acknowledgements

The `B@SEBALL` project (Biodiversity at school environments, benefits for all) was supported by [BELSPO](https://www.belspo.be/) under Contract - B2/191/P3/B@SEBALL.
