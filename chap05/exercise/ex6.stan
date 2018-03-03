data {
  int N;
  int<lower=0> Y[N];
  real<lower=0> X[N];
  int<lower=0, upper=1> F[N];
}

parameters {
  real b[3];
}

transformed parameters {
  real lambda[N];
  for (n in 1:N)
    lambda[n] = b[1] + b[2]*X[n] + b[3]*F[n];
}

model {
  for (n in 1:N)
    Y[n] ~ poisson_log(lambda[n]);
}

// http://discourse.mc-stan.org/t/multivariate-poisson-model-having-mysterious-nans-cryptic-errors/1490/2
/*
generated quantities {
  int y_pred[N];
  for (n in 1:N)
    y_pred[n] = poisson_log_rng(lambda[n]);
}
*/