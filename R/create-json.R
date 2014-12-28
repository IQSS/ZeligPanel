#' @include model-panelAR.R

library(jsonlite)

z5panelar <- zpanelar$new()
z5panelar$toJSON()

zeligpanelmodels <- list(zelig5panelmodels = list("panelar" = z5panelar$ljson))

cat(jsonlite::toJSON(zeligpanelmodels, pretty = TRUE),
    file = file.path("inst/JSON", "zelig5panelmodels.json"))
