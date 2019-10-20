get_ordinal_priors <- function(probs) {
  n <- length(probs)
  if(n < 2) (warning("Please specify the probability for at least two thresholds."))
  if(!is.numeric(probs)) (stop("Please specify a vector containing only numeric values."))

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
