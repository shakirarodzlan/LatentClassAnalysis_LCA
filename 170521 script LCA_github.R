
# INTRODUCTION.....................

## Latent Class ANalysis  (LCA) is a statistical model used to explore the unobserved heterogeneity in a population and then assigning individuals into mutually exclusive and exhaustive types or latent classes based on their pattern of answers on a set of measured variables
## In this study, we used  LCA  to identify patterns in the types of substances used (tobacco, alcohol, and other illicit substances) or latent class membership of polysubstance use.
## Currently, LCA is a method well used in substance use literature to explain the different patterns of substance use.


# ANALYSIS LCA......................................


# To read SPSS into R (Raw data in spss)

library(foreign)

#read spss data

myspss <- read.spss("170521 polyLCA3 for R.sav",
                    to.data.frame = TRUE, use.value.labels = FALSE)

##Install LCA package 
install.packages("poLCA")

library(poLCA)


# To save LCA output

sink("./outputlca180521.txt", append = T)

# LCA analysis

f1 <- as.formula (cbind(smoker, drinker, opiod, marijuana, amph, 
        kratom)~ 1)

# run model with 2 clases

LCA2 <- poLCA (f1, data = myspss , nclass = 2)
plot(LCA2)


# run model with 3 clases


LCA3 <- poLCA (f1, data = myspss, nclass = 3)
plot(LCA3)

# run model with 4 clases


LCA4 <- poLCA (f1, data = myspss , nclass = 4)
plot(LCA4)

# run model with 5 clases


LCA5 <- poLCA (f1, data = myspss , nclass = 5)
plot(LCA5)

## to stop save output

sink()



## Trial other model, Much better

f1 <- as.formula (cbind(smoker, drinker, opiod, marijuana, amph, 
                        kratom)~ 1)

poly2 <- poLCA (f1, myspss, nclass =2, maxiter = 50000, graphs = FALSE, nrep = 10, verbose = TRUE)
plot(poly2)

poly3 <- poLCA (f1, myspss, nclass =3, maxiter = 50000, graphs = FALSE, nrep = 10, verbose = TRUE)
plot(poly3)

pol4 <- poLCA (f1, myspss, nclass =4, maxiter = 50000, graphs = FALSE, nrep = 10, verbose = TRUE)
plot(pol4)

poly5 <- poLCA (f1, myspss, nclass =5, maxiter = 50000, graphs = FALSE, nrep = 10, verbose = TRUE)
plot(poly5)
