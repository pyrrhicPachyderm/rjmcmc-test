Data <- R6::R6Class("Data",
	public = list(
		n = 30,
		mean1 = 0,
		mean2 = 0,
		var = 0,
		sample1 = c(),
		sample2 = c(),
		
		initialize = function(n, t, scale, seed = 42) {
			set.seed(seed)
			#t is the desired t test statistic: t = (mean1 - mean2) / sqrt(2 * var / n).
			#scale = 1 will be taken to mean a standard deviation of 1.
			self$n <- n
			self$var <- scale^2
			diff <- t * sqrt(2 * self$var / n)
			self$mean1 <- diff/2
			self$mean2 <- -diff/2
			
			self$sample1 <- rnorm(self$n, mean = self$mean1, sd = sqrt(self$var))
			self$sample2 <- rnorm(self$n, mean = self$mean2, sd = sqrt(self$var))
		}
	)
)
