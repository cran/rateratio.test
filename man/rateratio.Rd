\name{rateratio.test}
\alias{rateratio.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{An Exact Rate Ratio Test Assuming Poisson Counts}
\description{
Performs the uniformy most powerful unbiased test on the ratio of rates of two Poisson counts 
with given time (e.g., perons-years) at risk for each count.
}
\usage{
rateratio.test(x, n, RR = 1, 
    alternative = c("two.sided", "less", "greater"), 
    conf.level = 0.95)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a vector of length 2 with counts for the two rates}
  \item{n}{a vector of length 2 with time at risk in each rate}
  \item{RR}{the null rate ratio (two.sided) or the rate ratio on boundary between null and alternative}
  \item{alternative}{ a character string specifying the alternative hypothesis,
          must be one of '"two.sided"' (default), '"greater"' or
          '"less"'.  You can specify just the initial letter. }
  \item{conf.level}{ confidence level of the returned confidence interval.  Must
          be a single number between 0 and 1. }
}
\details{
The \code{rateratio.test} tests whether the ratio of the first rate (estimated by x[1]/n[1]) 
over the second rate (estimated by x[2]/n[2]) is either equal to, less, or greater than 
\code{RR}.  Exact confidence intervals  
come directly from \code{binom.test}. The two-sided p-value is defined as either 1 or twice the minimum of 
the one-sided p-values. See Lehmann (1986, p. 152) or \code{vignette("rateratio.test")}.

For full discussion of the p-value and confidence interval consistency of inferences, see Fay (2010) and exactci package.

}
\value{
 An object of class `htest' containing the following components:
 \item{p.value}{the p-value of the test}
\item{estimate}{a vector with the rate ratio and the two individual rates}
\item{null.value}{the null rate ratio (two.sided) or the rate ratio on boundary between null and alternative}
\item{conf.int}{confidence interval}
\item{alternative}{type of alternative hypothesis}
\item{method}{description of method}
\item{data.name}{description of data}
}
\references{
Fay, M. P. (2010). Two-sided exact tests and matching confidence intervals for discrete data. R Journal, 2(1), 53-58.

Lehmann, E.L. (1986). Testing Statistical Hypotheses (second edition). Wadsworth and Brooks/Cole, Pacific Grove, California. }
\author{Michael Fay}
\note{ Much of the error checking code was taken from prop.test.    } 
% ~Make other sections like Warning with \section{Warning }{....} ~}
\seealso{ See \code{\link[exactci]{poisson.exact}} in the \code{\link[exactci]{exactci}} package, which gives the same test. }
\examples{
### p values and confidence intervals are defined the same way
### so there is consistency in inferences
rateratio.test(c(2,9),c(17877,16660))
### Small counts and large time values will give results similar to Fisher's exact test 
### since in that case the rate ratio is  approximately equal to the odds ratio 
### However, for the Fisher's exact test, the two-sided p-value is defined differently from 
###  the way the confidence intervals are defined and may imply different inferences
### i.e., p-value may say reject OR=1, but confidence interval says not to reject OR=1
fisher.test(matrix(c(2,9,17877-2,16660-9),2,2))
}
\keyword{htest}% at least one, from doc/KEYWORDS
