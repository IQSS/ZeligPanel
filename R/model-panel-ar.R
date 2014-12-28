zpanelar <- setRefClass("Zelig-panel-ar",
                           contains = "Zelig")

zpanelar$methods(
  initialize = function() {
    callSuper()
    .self$name <- "panel-ar"
    .self$fn <- quote(panelAR::panelAR)
    .self$authors <- "Konstantin Kashin"
    .self$description <- "Linear AR(1) Panel Data Models with Cross-Sectional Heteroskedasticity and/or Correlation"
    .self$year <- 2014
    .self$category <- "continuous"
    .self$wrapper <- "panelAR"
  }
)

zpanelar$methods(
  zelig = function(formula, data, ..., weights = NULL, by = NULL) {
    .self$zelig.call <- match.call(expand.dots = TRUE)
    .self$model.call <- .self$zelig.call
    callSuper(formula = formula, data = data, ...,
              weights = NULL, by = by)
  }
)

zpanelar$methods(
  param = function(z.out) {
    return(mvrnorm(.self$num, coef(z.out), vcov(z.out)))
  }
)

zpanelar$methods(
  qi = function(simparam, mm) {
    ev <- simparam %*% t(mm)
    pv <- ev
    return(list(ev = ev, pv = pv))
  }
)

