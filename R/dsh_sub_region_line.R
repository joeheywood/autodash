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
#' @param xlb Character string of title for xaxis
#' 
#' @param ylb Character string of title for yaxis
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
#' @import purrr

dsh_sub_region_line <- function(dat, ttl, xlb = "", ylb = "", src = "", 
                                lnk = "", hv = "%{y}", tckfmt = "") {
    
    cdat <- dat %>% left_join(shortens, by = "LAD11NM") %>%
        mutate(short = stringr::str_pad(short, 15, "right", " ")) %>%
        filter(!is.na(subregion)) 
    
    
    srctxt <- ifelse(src == "", "", paste0("<i>Data source: ", src, "</i>"))
    
    
    rgns <- c("Central", "North", "East1", "East2", "South", "West")
    
    pl <- c("#6da7de", "#9e0059", "#dee000", "#d82222", "#5ea15d",
            "#943fa6", "#63c5b5", "#ff38ba", "#eb861e")
    
    
    ## this ensures that the same color scheme appears in each
    ## subregion. It goes wrong if you don't do this!
    clrs <- pl[shortens$ix ]
    
    subdats <- map(rgns, function(rgn) {
        cdat %>% filter(subregion == rgn)
    }) %>% setNames(rgns)
    
    # if(is.null(ldat)) {
    #     ldn_d  <- cdat %>% group_by(x) %>% 
    #         summarise(y = transf(y, na.rm = TRUE)) %>% ungroup() %>%
    #         mutate(short = "London")
    # } else {
    #     ldn_d = ldat %>%
    #         mutate(short = "London") 
    # }
    
    updmns <-  list( list( active = 0, x = 0,  y = 1.3, 
                           buttons = list(
                               list(
                                   label = "London",
                                   method = "update",
                                   args = list(
                                       list(visible = c(TRUE, rep(FALSE, 32))),
                                       list(title = paste0(ttl, " (London)")) )
                                   
                                   )
                               )
                           )
                     )  
    fig <- plot_ly(type = "scatter", mode = "lines",  visible = TRUE,
                   data = cdat %>% filter(subregion == "London"), 
                   x = ~x, y = ~y,colors = clrs, text = ~txt,
                   hovertemplate = hv,
                   line = list(width = 4), color = ~short) 
    ix <- 2
    done <- 1
    show <- FALSE
    
    
    ## start with london?
    
    for(r in rgns) {
        nboros <- length(unique(subdats[[r]]$short))
        # print("-----------------------------")
        # print(paste0(nboros, " | ", r))
        # print(unique(subdats[[r]]$short))
        togo <- 33 - nboros - done 
        vsb <- c(rep(FALSE, done), rep(TRUE, nboros), rep(FALSE, togo))  
        # print(vsb)
        fig <- fig %>% add_lines(
            data = subdats[[r]],
            x = ~x, y = ~y, visible = show, color = ~short, text = ~txt) 
        updmns[[1]]$buttons[[ix]] <- list( 
            label = r, 
            method = "update", 
            args = list( 
                list(visible = vsb),
                list(title = paste0(ttl, " (Sub-region: ", r, ")"))
            )
        )
        
       ix <- ix + 1 
       done <- done + nboros
       show <- FALSE
    }
    
    fig %>%
        layout(
            updatemenus = updmns,
            margin = TRUE,
            hovermode = "x unified",
            title = list(text = paste0(ttl, " (London)"), 
                         x = 0.1),
            legend = list(width = 80),
            margin = TRUE,
            annotations = add_source(src, lnk),
            xaxis = list(title = xlb, showgrid = FALSE),
            yaxis = list(title = ylb, tickformat = tckfmt)
        )
            
    
    
}

# shortens <- fread("../indicators_dash/data/shortens.csv") %>% 
#     group_by(subregion) %>% 
#     mutate(ix = row_number()) %>%
#     ungroup() %>%
#     arrange(LAD11NM)
# 
# save(shortens, file = "data/shortens.RData")
