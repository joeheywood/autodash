#' Produce a multi bar chart in plotly
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
#' Multi-bar plotly chart object (stacked or dodged - more than one category)
#' @export
#'
#' @examples
#' chart_from_data("unemp")
#' 
#' @import plotly
#' 
dsh_mbar <- function(dat, ttl, yxttl = "", xxttl = "", src = "", lnk = "", 
                    tckfmt = "", hv = "%{y}", stack = FALSE) {
    
    clrs <- rev(c("#6da7de", "#9e0059", "#dee000", "#d82222", "#5ea15d"))
    
    bmd <- ifelse(stack == TRUE, "stack", "")
    hv <- glue("{hv}<extra></extra>")
    
    plot_ly(
        data = dat, type = "bar", 
        x = ~xvarchar, y = ~yval, color = ~yvllb,
        colors = clrs,
        hovertemplate = hv) %>%  
        layout(title = list(text = ttl, x = 0.05),
               annotations = add_source(src, lnk, y = -0.1),
               margin = TRUE,  
               barmode = bmd,
               hovermode = "x unified",
               legend = list(orientation = "h"),
               yaxis = list(title = yxttl, tickformat = tckfmt, 
                            showgrid = TRUE, 
                            gridcolor = "#dddddd"),
               xaxis = list(title = xxttl, showgrid = FALSE))
}

