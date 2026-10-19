#' @title Preprocess World Bank Data
#' @description Converts World Bank mortality data from wide
#' format to long format for years 2000 to 2019.
#' @param dataname A data frame containing World Bank data.
#' @param varname Name of the mortality variable in the output.
#' @return A data frame with iso, year, and mortality values.
#' @examples
#' wbfun(data.frame(iso = "CAN", X2000 = 10, X2001 = 12,
#'                  X2002 = 11, X2003 = 13, X2004 = 10,
#'                  X2005 = 12, X2006 = 11, X2007 = 13,
#'                  X2008 = 10, X2009 = 12, X2010 = 11,
#'                  X2011 = 13, X2012 = 10, X2013 = 12,
#'                  X2014 = 11, X2015 = 13, X2016 = 10,
#'                  X2017 = 12, X2018 = 11, X2019 = 13),
#'       "mortality")
#' @export
wbfun <- function(dataname, varname) {
  dataname |>
    dplyr::select(iso, X2000:X2019) |>
    tidyr::pivot_longer(
      cols = tidyselect::starts_with("X"),
      names_to = "year",
      names_prefix = "X",
      values_to = varname
    ) |>
    dplyr::mutate(year = as.numeric(year)) |>
    dplyr::arrange(iso, year)
}

#library(devtools)
#library(usethis)

#devtools::document()