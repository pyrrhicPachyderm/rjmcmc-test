# Reversible Jump Markov Chain Monte Carlo Test

A simple implementation of reversible jump MCMC to a classic problem, in order to examine the inherent tendency of Bayesian statistics to favour models with fewer parameters.

## Motivation

Bayesian statistics, and by extension reversible jump MCMC, has an inherent tendency to favour models with fewer parameters.
That is, posterior probability density will be higher (given an appropriate selection of parameters) for models with fewer parameters than with more parameters.
This is because adding more parameters, essentially smears the probability density across additional dimensions, hence reducing its height at any given point.

The above argument is the argument usually made, and it most cases I buy it.
It clearly applies in cases where the additional parameters are discrete (as a probability mass function is always less than or equal to one) and in cases where the additional parameters are continuous with a range substantially greater than one (as a probability density function with a range substantially greater than one will also tend to be less than or equal to one everywhere).
I don't totally buy the argument in the case where the additional parameters are continuous with a range smaller than one, however, as a probability density function with a range of less than one will be greater than one everywhere, so it would seem to increase the posterior probability density.

However, my results from other implementations of reversible jump MCMC suggest that the argument holds even in these cases.
Those implementations are upon problems that are too complicated to make for easy debugging, however.
This repository, therefore, is a simpler implementation to a simpler problem, in order to investigate the phenomenon, and either disprove or convince myself of the argument above.

## Problem

The problem shall be the Bayesian equivalent of a simple two sample t-test, assuming equal variance of the two samples, implemented using reversible jump MCMC.
The data shall be normally distributed, with known standard deviation, about two known means with a given difference.
By keeping the difference between the means as a constant multiple of the standard deviation, the posterior model selection distribution should be invariant as the data are rescaled.

There will be two models for the reversible jump MCMC to select between: a model with a single mean and variance, and a model with two distinct means (but still one shared variance).
The difference between these models is one parameter representing the mean.
Rescaling the data will change the range of this parameter, and hence test the phenomenon of interest.
