data(Rehm)

#----- Reference classes

z5 <- zpanelar$new()
z5
z5$zelig(NURR ~ gini + mean_ur + selfemp,
         data = Rehm, panelVar = "ccode", timeVar = "year", autoCorr = "ar1", 
         panelCorrMethod = "pcse", rho.na.rm = TRUE, panel.weight = "t-1", bound.rho = TRUE)
z5
z5$setx(gini = 25)
z5
z5$sim()
z5$graph()
z5$cite()

#----- Wrappers

z.out <- zelig(NURR ~ gini + mean_ur + selfemp, model = "panelAR",
               data = Rehm, panelVar = "ccode", timeVar = "year", autoCorr = "ar1", 
               panelCorrMethod = "pcse", rho.na.rm = TRUE, panel.weight = "t-1", bound.rho = TRUE)
z.out
x.out <- setx(z.out, gini = 25)
z.out
s.out <- sim(z.out, x.out)
plot(s.out)
