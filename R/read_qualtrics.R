read_qualtrics <- function(file) {
  col_names <- file %>%
    readr::read_csv(col_names = FALSE, n_max = 1) %>%
    as.character()

  readr::read_csv(file,
           skip = 3,
           col_name = col_names)
}
