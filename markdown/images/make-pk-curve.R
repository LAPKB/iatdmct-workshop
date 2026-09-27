# Generates images/pk-curve.png — the figure used in the "Images and figures"
# slide of slides.qmd. Reproduce with:
#
#   Rscript images/make-pk-curve.R
#
# It uses only base R, so no packages are required.

csv <- file.path("examples", "data", "patient-concentrations.csv")
if (!file.exists(csv)) {
  stop("Run this script from the repository root: Rscript images/make-pk-curve.R")
}

conc <- read.csv(csv)
dir.create("images", showWarnings = FALSE)

# Mono-exponential fit: log(C) = log(C0) - k * t
fit <- lm(log(conc_mgL) ~ time_h, data = conc)
C0 <- exp(coef(fit)[1])
k <- -coef(fit)[2]

png("images/pk-curve.png", width = 1600, height = 800, res = 200)
par(mar = c(4.2, 4.4, 1.2, 0.8), cex.axis = 0.9, cex.lab = 1.0, family = "sans")
tt <- seq(0, 12, length.out = 200)
plot(conc$time_h, conc$conc_mgL,
  pch = 19, col = "#1b6ca8", cex = 1.1,
  xlab = "Time after dose (h)", ylab = "Concentration (mg/L)",
  xlim = c(0, 12), ylim = c(0, 20), bty = "l", las = 1
)
lines(tt, C0 * exp(-k * tt), col = "#b3502a", lwd = 2)
legend("topright",
  legend = c("Observed", "C(t) = (D/V) * exp(-k*t)"),
  col = c("#1b6ca8", "#b3502a"), pch = c(19, NA), lty = c(NA, 1),
  lwd = c(NA, 2), bty = "n", cex = 0.9
)
invisible(dev.off())

cat(sprintf(
  "Wrote images/pk-curve.png  (C0 = %.1f mg/L, k = %.4f /h, t1/2 = %.1f h)\n",
  C0, k, log(2) / k
))
