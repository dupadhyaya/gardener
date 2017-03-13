# Practise 3 : Gradient Descent
## Linear regression
set.seed(42)
N <- 1e4
d <- 10
X <- matrix(rnorm(N*d), ncol=d)
theta <- rep(5, d+1)
eps <- rnorm(N)
y <- cbind(1, X) %*% theta + eps
dat <- data.frame(y=y, x=X)
library(sgd)
sgd.theta <- sgd(y ~ ., data=dat, model="lm")
sprintf("Mean squared error: %0.3f", mean((theta - as.numeric(sgd.theta$coefficients))^2))
## Wine quality (Cortez et al., 2009): Logistic regression
set.seed(42)
data("winequality")
dat <- winequality
dat$quality <- as.numeric(dat$quality > 5) # transform to binary
test.set <- sample(1:nrow(dat), size=nrow(dat)/8, replace=FALSE)
dat.test <- dat[test.set, ]
dat <- dat[-test.set, ]
sgd.theta <- sgd(quality ~ ., data=dat,
                 model="glm", model.control=binomial(link="logit"),
                 sgd.control=list(reltol=1e-5, npasses=200),
                 lr.control=c(scale=1, gamma=1, alpha=30, c=1))
sgd.theta