% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/txshift.R
\name{txshift}
\alias{txshift}
\title{Compute Estimate of the Counterfactual Mean Under Shifted Treatment}
\usage{
txshift(W, A, Y, C = rep(1, length(Y)), V = NULL, delta = 0,
  estimator = c("tmle", "onestep"), fluc_method = c("standard",
  "weighted"), eif_tol = 1/length(Y), max_iter = 10000,
  ipcw_fit_args = list(fit_type = c("glm", "sl", "fit_spec"), sl_lrnrs =
  NULL), g_fit_args = list(fit_type = c("hal", "sl", "fit_spec"), n_bins
  = c(10, 25), grid_type = c("equal_range", "equal_mass"), lambda_seq =
  exp(seq(-1, -13, length = 300)), use_future = FALSE, sl_lrnrs_dens =
  NULL), Q_fit_args = list(fit_type = c("glm", "sl", "fit_spec"),
  glm_formula = "Y ~ .", sl_lrnrs = NULL), eif_reg_type = c("hal",
  "glm"), ipcw_efficiency = TRUE, ipcw_fit_spec = NULL,
  gn_fit_spec = NULL, Qn_fit_spec = NULL)
}
\arguments{
\item{W}{A \code{matrix}, \code{data.frame}, or similar corresponding to a
set of baseline covariates.}

\item{A}{A \code{numeric} vector corresponding to a treatment variable. The
parameter of interest is defined as a location shift of this quantity.}

\item{Y}{A \code{numeric} vector of the observed outcomes.}

\item{C}{A \code{numeric} binary vector giving information on whether a given
observation was subject to censoring. This is used to compute an IPCW-TMLE
in cases where two-stage sampling is performed. The default assumes that no
censoring was present (i.e., a two-stage design was NOT used). N.B., this is
equivalent to the term %\Delta in the notation used in the original Rose and
van der Laan manuscript that introduced/formulated IPCW-TML estimators.}

\item{V}{The covariates that are used in determining the sampling procedure
that gives rise to censoring. The default is \code{NULL} and corresponds to
scenarios in which there is no censoring (in which case all values in the
preceding argument \code{C} must be uniquely 1. To specify this, pass in a
NAMED \code{list} identifying variables amongst W, A, Y that are thought to
have played a role in defining the sampling/censoring mechanism (C).}

\item{delta}{A \code{numeric} value indicating the shift in the treatment to
be used in defining the target parameter. This is defined with respect to
the scale of the treatment (A).}

\item{estimator}{The type of estimator to be fit, either \code{"tmle"} for
targeted maximum likelihood estimation or \code{"onestep"} for a one-step
augmented inverse probability weighted (AIPW) estimator.}

\item{fluc_method}{The method to be used in submodel fluctuation step of
the TMLE computation. The choices are "standard" and "weighted".}

\item{eif_tol}{A \code{numeric} giving the convergence criterion for the TML
estimator. This is the the maximum mean of the efficient influence function
(EIF) to be used in declaring convergence (theoretically, should be zero).}

\item{max_iter}{A \code{numeric} integer giving the maximum number of steps
to be taken in iterating to a solution of the efficient influence function.}

\item{ipcw_fit_args}{A \code{list} of arguments, all but one of which are
passed to \code{est_ipcw}. For details, please consult the documentation for
\code{est_ipcw}. The first element of this (i.e., \code{fit_type}) is used
to determine how this regression is fit: "glm" for generalized linear model,
"sl" for a Super Learner, and "fit_spec" a user-specified input of the form
produced by \code{est_ipcw}. NOTE THAT this first argument is not passed to
\code{est_ipcw}.}

\item{g_fit_args}{A \code{list} of arguments, all but one of which are passed
to \code{est_g}. For further details, please consult the documentation for
\code{est_g}. The first element of this (i.e., \code{fit_type}) is used to
determine how this regression is fit: \code{"hal"} for a method using the
highly adaptive lasso to fit conditional densities via the \code{haldensify}
package, \code{"sl"} for \code{sl3} learners used to fit Super Learner to
densities via \code{Lrnr_haldensify} or similar, and \code{"fit_spec"} for
user-specified input of the form produced by \code{est_g}. NOTE THAT this
first argument is not passed to \code{est_g}.}

\item{Q_fit_args}{A \code{list} of arguments, all but one of which are passed
to \code{est_Q}. For further details, please consult the documentation for
\code{est_Q}. The first element of this (i.e., \code{fit_type}) is used to
determine how this regression is fit: \code{"glm"} for a generalized linear
model for the outcome regression, \code{"sl"} for \code{sl3} learners used
to fit a Super Learner for the outcome regression, and \code{"fit_spec"} for
user-specified input of the form produced by \code{est_Q}. NOTE THAT this
first argument is not passed to \code{est_g}.}

\item{eif_reg_type}{Whether a flexible nonparametric function ought to be
used in the dimension-reduced nuisance regression of the targeting step for
the censored data case. By default, the method used is a nonparametric
regression based on the Highly Adaptive Lasso (from package \code{hal9001}).
Set this to \code{"glm"} to instead use a simple linear regression model.
In this step, the efficient influence function (EIF) is regressed against
covariates contributing to the censoring mechanism (i.e., EIF ~ V | C = 1).}

\item{ipcw_efficiency}{Whether to invoke an augmentation of the IPCW-TMLE
procedure that performs an iterative process to ensure efficiency of the
resulting estimate. The default is \code{TRUE}; only set to \code{FALSE} if
possible inefficiency of the IPCW-TMLE is not a concern.}

\item{ipcw_fit_spec}{User-specified version of the argument above for fitting
the censoring mechanism (\code{ipcw_fit_args}). Consult the documentation
for that argument for details on how to properly use this. In general, this
should only be used by advanced users familiar with both the underlying
theory and this software implementation of said theory.}

\item{gn_fit_spec}{User-specified version of the argument above for fitting
the treatment mechanism (\code{g_fit_args}). Consult the documentation for
that argument for details on how to properly use this. In general, this
should only be used by advanced users familiar with both the underlying
theory and this software implementation of said theoretical details.}

\item{Qn_fit_spec}{User-specified version of the argument above for fitting
the outcome mechanism (\code{Q_fit_args}). Consult the documentation for
that argument for details on how to properly use this. In general, this
should only be used by advanced users familiar with both the underlying
theory and this software implementation of said theoretical details.}
}
\value{
S3 object of class \code{txshift} containing the results of the
 procedure to compute a TML estimate of the treatment shift parameter.
}
\description{
Compute Estimate of the Counterfactual Mean Under Shifted Treatment
}