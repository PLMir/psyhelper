
<!-- README.md is generated from README.Rmd. Please edit that file -->

# psyhelper

<!-- badges: start -->

<!-- badges: end -->

psyhelper is small (definitely growing\!) collection of convenience
functions in order to help you (and me) analyze behavioral data. For
now, it does two things: it helps you read csv files downloaded from
Qualtrics directly, despite the weird three-rows header of column names.
It also helps you when you need to set priors for an ordinal variable
(such as a Likert scale) for Bayesian modeling (for instance with brms)
by converting your probabilities into cumulative log odds.

The package uses tidyverse
functions.

## Installation

<!-- You can install the released version of psyhelper from [CRAN](https://CRAN.R-project.org) with: 

``` r
install.packages("psyhelper")
``` -->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("PLMir/psyhelper")
```

## Example 1

You just downloaded the file “my\_qualtrics\_data.csv” from Qualtrics
and you would now like to use it for data analysis in R.

``` r
library(psyhelper)

data_file <- read_qualtrics("my_qualtrics_data.csv")
```

## Example 2

Your response variable is on a 5-point Likert scale and so you wisely
decided to use a cumulative distribution (for reasons why, see Lidell &
Kruschke, 2018) for your Bayesian model (e.g. using brms). Now, you want
to specify priors for the response points, but you represent priors in
your mind in terms of the probability for each response point, and the
model needs you to specify them using cumulative log odds.

``` r
library(psyhelper)

get_ordinal_priors(c(20, 20, 30, 15, 15))
#> Cumulative probabilities always sum to 1 so the log odds for the last threshold is not returned.
#> [1] -1.3862944 -0.4054651  0.8472979  1.7346011
```
