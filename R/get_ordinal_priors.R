#' Get priors for an ordinal variable converted into cumulative log odds
#'
#' @param probs A vector of probabilities for each threshold (i.e response point) on your scale.
#'   Probabilities must sum to 1 or to 100.
#'
#' @return A vector of cumulative log odds for all n-1 thresholds (i.e. response points).
#'   The cumulative log odds for the nth threshold are not returned, given that :
#'   1) the log odds for the last threshold does not need to be specified as a prior in bmrs;
#'   2) probabilities nessarily sum to 1 and the log odds for 1 is Inf.
#' @export
#'
#' @examples
#' # You may specify the probabilities as percentages.
#' get_ordinal_priors(5, 20, 10, 15, 25, 25) # -2.9444390 -1.0986123 -0.6190392  0.0000000  1.0986123
#'
#' # You may also specify the probabilities on a 0 to 1 scale.
#' get_ordinal_priors(.05, .2, .1, .15, .25, .25)
#'
#' \dontrun{
#' # These will return an error because those probabilities do not sum to 100 or to 1
#' get_ordinal_priors{c(50, 45)
#' get_ordinal_priors{c(.5, .45)
#' }

get_ordinal_priors <- function(probs) {
  if(!is.numeric(probs)) (stop("Please specify a vector containing only numeric values."))
  n <- length(probs)
  if(n < 2) (warning("Please specify the probability for at least two thresholds."))

  sum_probs <- sum(probs)

  if(sum_probs == 1) {
    probs <- probs
  } else if (sum_probs == 100) {
    probs <- probs / 100
  } else {
    stop(paste0("Your probabilities sum to ", sum_probs, ". Please specificy probabilities that sum to 1 or to 100%."))
  }

  cum_probs <- cumsum(probs)
  log_odds <- stats::qlogis(cum_probs)
  message("Note that you are not given the log odds for the last threshold as it does not need to be specified. (Cumulative probabilities always sum to 1.)")
  return(log_odds[-n])
}
