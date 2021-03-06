% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dsh_line.R
\name{dsh_line}
\alias{dsh_line}
\title{Produce a single line chart in plotly}
\usage{
dsh_line(
  dat,
  ttl = "",
  mrk = FALSE,
  wdth = 4,
  src = "*",
  link = "",
  xxttl = "",
  yxttl = "",
  tckfmt = "",
  hv = "\%{y}"
)
}
\arguments{
\item{dat}{data frame with correct column headings}

\item{ttl}{Chart title (character)}

\item{mrk}{TRUE if markers added to each point (default FALSE)}

\item{wdth}{Width of line (default 4)}

\item{src}{Character string of source of data}

\item{link}{Character string of link of source}

\item{xxttl}{Character string of title for xaxis}

\item{yxttl}{Character string of title for yaxis}

\item{tckfmt}{Tick format (eg \% for percentage)}

\item{hv}{hovertemplate}
}
\value{
Single line plotly chart object
}
\description{
Produce a single line chart in plotly
}
\examples{
chart_from_data("unemp")

}
