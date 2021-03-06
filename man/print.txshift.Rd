% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{print.txshift}
\alias{print.txshift}
\title{Print Method for txshift Objects}
\usage{
\method{print}{txshift}(x, ...)
}
\arguments{
\item{x}{An object of class \code{txshift}.}

\item{...}{Other options (not currently used).}
}
\value{
None. Called for the side effect of printing particular slots of
 objects of class \code{txshift}.
}
\description{
Print Method for txshift Objects
}
\details{
The \code{print} method for objects of class \code{txshift}.
}
\examples{
set.seed(429153)
n_obs <- 100
W <- replicate(2, rbinom(n_obs, 1, 0.5))
A <- rnorm(n_obs, mean = 2 * W, sd = 1)
Y <- rbinom(n_obs, 1, plogis(A + W + rnorm(n_obs, mean = 0, sd = 1)))
txout <- txshift(
  W = W, A = A, Y = Y, delta = 0.5,
  estimator = "tmle",
  g_fit_args = list(
    fit_type = "hal", n_bins = 5,
    grid_type = "equal_mass",
    lambda_seq = exp(-1:-9)
  ),
  Q_fit_args = list(
    fit_type = "glm",
    glm_formula = "Y ~ ."
  )
)
print(txout)
}
