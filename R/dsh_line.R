#' Produce a single line chart in plotly
#'
#' @param dat data frame with correct column headings
#'
#' @param ttl Chart title (character)
#' 
#' @param mrk TRUE if markers added to each point (default FALSE)
#' 
#' @param wdth Width of line (default 4)
#' 
#' @param src Character string of source of data
#' 
#' @param link Character string of link of source
#' 
#' @param xxttl Character string of title for xaxis
#' 
#' @param yxttl Character string of title for yaxis
#' 
#' @param tckfmt Tick format (eg % for percentage)
#' 
#' @param hv hovertemplate
#' 
#' @return
#' Single line plotly chart object
#' @export
#'
#' @examples
#' chart_from_data("unemp")
#' 
#' @import plotly
#' 
dsh_line <- function(dat, ttl = "", mrk = FALSE, wdth = 4, src = "*", 
                     link = "", xxttl = "", yxttl = "", tckfmt = "", 
                     hv = "%{y}") {
    pl <- c("#6da7de", "#9e0059")
    
    if(mrk == TRUE) {
        mrkx <- list(color = pl[1], size = wdth * 2)
    } else {
        mrkx <- list()
    }
    
    hv <- paste0(hv, "<extra></extra>")
    
    lnx <- list(color = pl[1], width = wdth)
    
    md <- ifelse(mrk, "lines+markers", "lines")
    
    # dat$xvar <- ifelse(dat$xwhich == 1, dat$xvarchar, dat$xvardt)
    
    plot_ly(type = "scatter", mode = md,  data = dat, 
            x = ~xvar, y = ~yval, hovertemplate = hv, 
            text = ~text, line = lnx, marker = mrkx) %>%  
        layout(title = list(text = ttl, x = 0.01), 
               margin = TRUE,
               annotations = add_source(src, link),
               yaxis = list(title = yxttl, 
                            showgrid = TRUE, 
                            tickformat = tckfmt,
                            gridcolor = "#dddddd"), 
               xaxis = list(title = xxttl, showgrid = FALSE))
}
