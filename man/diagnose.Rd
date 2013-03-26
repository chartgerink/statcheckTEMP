\name{diagnose}
\alias{diagnose}
\title{
Diagnose the most likely cause for p values that are inconsistent with their test statistic and degrees of freedom.
}
\description{
This function analyzes whether inconsistent results in articles (as diagnosed with \code{\link{statcheck}} could be due to one of the most frequently observed causes (Bakker & Wicherts, 2011).
}
\usage{
diagnose(x)
}
\arguments{
  \item{x}{
a \code{statcheck} output.
}
}
\value{
a list that contains four dataframes: ErrorDiagnosis, CopyPaste, Summary, and FullDiagnosis. In the following sections the content of these dataframes will be described in detail. 
}
\section{ErrorDiagnosis}{
\describe{
This dataframe contains the error diagnosis of the analyzed articles that contained an error and has the following components: 
\item{Source}{Name of the file of which the statistic is extracted}
\item{Raw}{Raw string of the statistical reference that is extracted}
\item{Computed}{The recomputed p-value}
\item{OneTail}{Logical. Is it likely that the reported p value resulted from a correction for one-sided testing?}
\item{CorrectRound}{Logical. Is the reported p value correct when we take the possibility into account that the test statistic was rounded after calculating the corresponding p value? For instance, a reported t value of 2.35 could correspond to an actual value of 2.345 to 2.354 with a range of p values that can slightly deviate from the recomputed p value but still be correct.}
\item{RoundError}{Logical. P value wrongly rounded upward or downward. E.g. rounding a p value of .049 to .04.}
\item{PSmallerThanZero}{Logical. Reported p <.000.}
\item{SmallerInsteadEqual}{Logical. Reported "<" when "=" would be correct. E.g. F(2,20)=2.33, p <.123, whereas the correct p value is equal to .123.}
\item{Bonferroni}{Logical. Could the reported p value have resulted from a Bonferroni correction? Note: The corrected p values were calculated by multiplying the reported p values by the number of statistical results reported in one article. This is a rough estimation.}
\item{Unidentifiable}{Logical. The error could not be classified on the basis of the extracted information.}
\item{CopyPaste}{Logical. Does the exact string of the extracted raw results occur anywhere else in the article?}
}
}
\section{CopyPaste}{
\describe{
This dataframe contains an overview of the detected copy-paste errors in all the articles. Its components are the same as the ones in ErrorDiagnosis. Note that a copy-paste error could still be congruent in terms of test statistic and p value, so it is possible that these errors do not show up in ErrorDiagnosis. 
}
}
\section{FullDiagnosis}{
\describe{
This dataframe contains the error diagnosis for every article, not just the articles that contained an error. The components are the same as in ErrorDiagnosis. This dataframe is not automatically printed but can be obtained through $FullDiagnosis.
}
}
\references{
Bakker, M. & Wicherts, J. M. (2011). The (mis)reporting of statistical results in psychology journals. Behavior Research Methods, 43, 666-678.
}
\author{
Sacha Epskamp <mail@sachaepskamp.com> & Michele B. Nuijten <m.b.nuijten@uvt.nl>
}
\note{
Please note that the resulting diagnosis is more a rough indication of what could be going on than it is a clear cut verdict. The function is therefore most suitable if you want to get a rough idea of the type of errors made in a certain set of articles. 
}
\seealso{
\code{\link{statcheck}}, \code{\link{identify.statcheck}}
}
\examples{
\dontrun{
# given that the articles of interest are saved in "DIR"
DIR <- "C:/mydocuments/articles"
stat_result <- checkdir(DIR)

diagnosis <- diagnose(stat_result)

# print diagnosis
diagnosis

# print diagnosis for all articles
diagnosis$FullDiagnosis

}
}