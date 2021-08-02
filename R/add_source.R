#' Add source to plotly chart
#'
#' @param src Source text to show 
#'
#' @param lnk Link text (if blank the source text will not be a link)
#' 
#' @param y Where on the y axis (paper) the link will appear defaults to bottom right corner (-.1)
#' 
#' @return
#' List to add to annotations object withing layout list of plotly chart
#' @export
#'
#' @examples
#' add_source(src = "London Datastore", lnk = "data.london.gov.uk")
#' 
#' @import glue
#' 

add_source <- function(src, lnk = "", y = -0.1) {
    if(nchar(lnk) == 0) {
        txt <- glue("<i>Source: <i>{src}</i>")
    } else {
        txt <- glue("<i>Source: <i><a href='{lnk}'>{src}</a></i>")
    }
    
    list(
        x = 1, y = y,
        text = txt,
        showarrow = F, xref='paper', yref='paper',
        xanchor='right', yanchor='auto', xshift=0, yshift=0,
        font=list(size=12, color="#565656")
    )
}
