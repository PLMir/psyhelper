#' Use read_csv on files downloaded from Qualtrics
#'
#' Data files exported from Qualtrics are famously difficult to import in R as the
#' first three rows contain column names, text from the prompts and question labels.
#' The second row contains the most user friendly information, but because it is not possible
#' to skip both the first and the third row when reading a file, this usually leads to the
#' annoying consequence that your first row contains strings, which are either converted to factors
#'  or force you to specify the type for all columns.
#'  Use \code{read_qualtrics} instead to directly import your csv file with usable column names and
#'  allow \code{read_csv} to impute your column types.
#'
#' @param A path to a csv file imported from Qualtrics
#'
#' @return A tibble().
#' @export
#'
#' @examples
#' \dontrun{
#' read_qualtrics("qualtrics_import.csv")
#' }
#'

read_qualtrics <- function(file) {
  col_names <- file %>%
    readr::read_csv(col_names = FALSE, n_max = 1) %>%
    as.character()

  readr::read_csv(file,
           skip = 3,
           col_name = col_names)
}
