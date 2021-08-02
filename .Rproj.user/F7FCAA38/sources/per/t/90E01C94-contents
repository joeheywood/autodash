
#' Produce a single bar chart in plotly
#'
#' @param dat data frame with correct column headings
#'
#' @param ttl Chart title (character)
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
#' Single bar plotly chart object (one category)
#' @export
#'
#' @examples
#' chart_from_data("unemp")
#' 
#' @import plotly
#' 
dsh_bar <- function(dat, ttl, yxttl = "", xxttl = "", src = "", lnk = "", 
                    tckfmt = "", hv = "%{y}") {
    
    clrs <- c("#6da7de", "#9e0059")
    
    ## defaults to arrange data by
    dat <- dat %>% arrange(text) %>%
        mutate(cll = ifelse(xvarchar %in% 
                                c("London", "England", "United Kingdom"), 
                            2, 1))
    
    
    plot_ly(
        data = dat, type = "bar", 
        x = ~xvarchar, y = ~yval, 
        hovertemplate = hv,
        marker = list(color = ~clrs[cll], 
                      line = list(color = ~clrs[cll]))) %>%  
        layout(title = list(text = ttl, x = 0.05),
               annotations = add_source(src, lnk, y = 1),
               margin = TRUE, 
               yaxis = list(title = yxttl, tickformat = tckfmt, 
                            showgrid = TRUE, 
                            gridcolor = "#dddddd"),
               xaxis = list(title = xxttl, 
                            showgrid = FALSE,
                            categoryorder = "array",
                            categoryarray = ~text))
}
