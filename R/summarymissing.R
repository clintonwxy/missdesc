#' Missingness Summary.
#'
#' This function returns a missingness summary of a data.frame.
#'
#' @param data Data.frame input.
#' @param sum.col Logical. Returns the names of missing columns. Defaults to TRUE.
#' @param missgraph Logical. Plots a graph of the overall missing summary. Defaults to TRUE.
#'
#' @keywords missing, summary
#'
#' @return The missing percentages of the overall data.frame, by rows and by columns.
#'
#' @export
#' @examples
#' summarymissing(testdf, sum.col = TRUE, missgraph = FALSE)


summarymissing <- function(data, sum.col = TRUE, missgraph = FALSE) {

  if (class(data) != "data.frame") {

    stop("Please enter a data.frame.")

  } else {

    # 1. a. Overall dimension and missingness
    dimensions <- dim(data)
    perc.complete <- round(sum(!is.na(data)) / prod(dim(data)) * 100, digits = 2)
    perc.missing <- 100 - perc.complete

    # 1. b. Missingness by columns
    n.missing.col = c(rep(1, NCOL(data)))

    for (i in seq_along(data)) {
      n.missing.col[i] = ifelse(sum(is.na(data[ ,i])) > 0, 1, 0)
    }

    perc.complete.col <- round((1 - sum(n.missing.col) / NCOL(data)) * 100, digits = 2)

    # 1. c. Missingness by rows
    n.missing.row = c(rep(1, NROW(data)))

    for (i in 1:NROW(data)) {
      n.missing.row[i] = ifelse(sum(is.na(data[i, ])) > 0, 1, 0)
    }

    perc.complete.row <- round((1 - sum(n.missing.row) / NROW(data)) * 100, digits = 2)

    # 1. d. Printing out overall missingness summary
    cat("Summary of Overall Missingness in", deparse(substitute(data)), "\n")
    cat("  Dimensions:                  ", dimensions, "\n")
    cat("  Percentage complete:          ", perc.complete, "% \n", sep = "")
    cat("  Percentage missing:           ", perc.missing, "% \n", sep = "")
    cat("  Percentage complete columns:  ", perc.complete.col, "% \n", sep = "")
    cat("  Percentage complete rows:     ", perc.complete.row, "% \n", sep = "")


    # 2. Names of Missing Columns

    if (sum.col == TRUE) {

      cat("\n", "Summary of Missing Columns", "\n", sep = "")

      if (perc.complete.col == 100) {

        cat("  There are 0 missing columns")

      } else {

        for (i in 1:length(n.missing.col)) {

          if (n.missing.col[i] == 1) {

            cat(" ", i, "|", names(data)[i], "\n")
          }
        }
      }
    }

    # 3. Graph of Missingness

    if (missgraph == TRUE) {
      missing.summary <- data.frame(
        Metrics = c("Overall", "Columns", "Rows"),
        Percentage = c(perc.complete, perc.complete.col, perc.complete.row))

      missing.summary$Metrics <- factor(missing.summary$Metrics,
                                        levels = c("Overall", "Columns", "Rows"))

      ggplot(data = missing.summary, aes(y = Percentage,
                                         x = Metrics)) +
        geom_col() +
        ylim(0, 100) +
        geom_text(aes(label = Percentage),
                  vjust = 2,
                  color = "white",
                  size = 5) +
        labs(title = "Graph of missingness by overall, columns and rows") +
        theme_minimal()
    }
  }
}

