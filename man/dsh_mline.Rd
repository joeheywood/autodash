% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dsh_mline.R
\name{dsh_mline}
\alias{dsh_mline}
\title{Produce a multi-line chart in plotly}
\usage{
dsh_mline(
  dat,
  ttl = "",
  mrk = FALSE,
  wdth = 4,
  src = "*",
  link = "",
  xxttl = "",
  yxttl = "",
  tckfmt = "",
  hv = "\%{y}",
  hgh = FALSE
)
}
\arguments{
\item{dat}{data frame with correct column headings}

\item{ttl}{Chart title (character)}

\item{mrk}{TRUE if markers added to each point (default FALSE)}

\item{wdth}{Width of line (default 4)}

\item{src}{Character string of source of data}

\item{link}{Character string of link of source}

\item{tckfmt}{Tick format (eg \% for percentage)}

\item{hv}{hovertemplate}

\item{hgh}{TRUE/FALSE if use highlight colour palette}

\item{xttl}{Character string of title for xaxis}

\item{yttl}{Character string of title for yaxis}
}
\value{
Multi-line plotly chart object
}
\description{
Produce a multi-line chart in plotly
}
\examples{
chart_from_data("unemp")

}
