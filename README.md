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

The model I'll be implementing is inspired by the first example in the paper that introduced reversible jump MCMC, Green 1995 (https://doi.org/10.1093/biomet/82.4.711).
The data in that model are the dates of British mining disasters, and the model is a Poisson process with the rate defined by a step function.
The number of steps, and hence the number of parameters in the model, is variable, making this a problem for reversible jump MCMC.
Each additional step added adds two new parameters: the location of the step, and the height of the function after the step.

The location of the step is useful for these purposes, as that is a continuous variable over an arbitrary range with strictly defined boundaries.
As such, rescaling this range provides a very useful method of testing the effect of the range of additional parameters.
However, in the original model, the other additional parameter is a rate of a Poisson process.
As such, rescaling the time will inversely rescale the rate, cancelling any effect of rescaling.
Therefore, for this test, the model must be changed such that the value being defined with a step function is not a rate.
