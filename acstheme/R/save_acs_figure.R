#' Save figure with ACS publication defaults
#'
#' @param filename Output filename
#' @param plot Plot object (defaults to last plot)
#' @param width Width in inches (default 3.35 for single column)
#' @param height Height in inches (default 4.5)
#' @param dpi DPI resolution (default 300)
#' @param units Units for width and height (default "in")
#' @param ... Additional arguments to ggsave
#' @return Invisibly returns the filename
#' @export
save_acs_figure <- function(filename,
                            plot = ggplot2::last_plot(),
                            width = 3.35,
                            height = 4.5,
                            dpi = 300,
                            units = "in",
                            ...) {
  ggplot2::ggsave(
    filename = filename,
    plot = plot,
    width = width,
    height = height,
    dpi = dpi,
    units = units,
    compression = "lzw",
    ...
  )
  invisible(filename)
}
