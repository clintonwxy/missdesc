
# missdesc

<!-- badges: start -->
<!-- badges: end -->

The goal of missdesc is to get instant summary statistics on the missingness of a data set. It is noted that this function only works with data sets and not matrices. With the function `summarymissing`, it would generate a missingness summary of the entire data set, by rows, by columns and the list of incomplete columns.

<br>

## Installation

You can install the released version of missdesc from [GitHub](https://github.com/clintonwxy) with:

``` r
devtools::install_github("clintonwxy/missdesc")
```
<br>

## Example

This is a basic example which shows you how to obtain the missingness summary

``` r
library(missdesc)
summarymissing(testdf, sum.col = TRUE, missgraph = FALSE)
```

