## ---- echo=FALSE--------------------------------------------------------------
set.seed(0)

## -----------------------------------------------------------------------------
data(interleaved_data, package = "wmfastr") # no preference
data(interleaved_data_a, package = "wmfastr") # preference for A
data(interleaved_data_b, package = "wmfastr") # preference for B

## ---- results='asis'----------------------------------------------------------
knitr::kable(head(interleaved_data_b))

## -----------------------------------------------------------------------------
library(wmfastr)

## ----no_pref------------------------------------------------------------------
x <- interleaved_data[interleaved_data$event == "click", ]
x <- x[order(x$session_id, x$timestamp), ]
boot_x <- interleaved_bootstraps(x$session_id, x$ranking_function)
hist(boot_x, col = "gray70", border = NA, main = "No preference", xlab = "Bootstrapped preferences")
abline(v = quantile(boot_x, c(0.025, 0.975)), lty = "dashed")
abline(v = interleaved_preference(x$session_id, x$ranking_function), lwd = 2)

## ----a_pref-------------------------------------------------------------------
y <- interleaved_data_a[interleaved_data_a$event == "click", ]
y <- y[order(y$session_id, y$timestamp), ]
boot_y <- interleaved_bootstraps(y$session_id, y$ranking_function)
hist(boot_y, col = "gray70", border = NA, main = "Preference for A", xlab = "Bootstrapped preferences")
abline(v = quantile(boot_y, c(0.025, 0.975)), lty = "dashed")
abline(v = interleaved_preference(y$session_id, y$ranking_function), lwd = 2)

## ----b_pref-------------------------------------------------------------------
z <- interleaved_data_b[interleaved_data_b$event == "click", ]
z <- z[order(z$session_id, z$timestamp), ]
boot_z <- interleaved_bootstraps(z$session_id, z$ranking_function)
hist(boot_z, col = "gray70", border = NA, main = "Preference for B", xlab = "Bootstrapped preferences")
abline(v = quantile(boot_z, c(0.025, 0.975)), lty = "dashed")
abline(v = interleaved_preference(z$session_id, z$ranking_function), lwd = 2)

