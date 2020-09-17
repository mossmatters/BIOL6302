# Molecular Evolution

BIOL6304: Principles of Phylogenetics


## Learning Objectives
Following this lesson, students will be able to:

* Calculate a neighbor joining tree from a DNA character matrix
* Implement different models of molecular evolution 
* Evaluate the best fit molecular model using the AIC method


## Neighbor Joining in PAUP

Distance methods like neighbor joining are fast to compute, but may not be accurate representations of phylogenetic distance, unless a realistic model of evolution is used. In PAUP, the default distance metric used is pairwise-dissimilarity, otherwise known as p-distance.

To calculate a neighbor joining tree, first we will open and execute a DNA character matrix. From the File menu select Open and navigate to the `Artocarpus.nex` file.

**COMMAND LINE USERS**: You will need to find the full "path" to the file and enter the command:

`execute Artocarpus.nex`

On a Mac, you can locate the file in the Finder and drag the file to the PAUP command window to paste the full path. Once the file has successfully executed, change the optimality criterion to Distance in the Analysis menu.

**COMMAND LINE USERS**: Set the optimality criterion with the command: `set criterion=distance`

To comptue a neighbor-joining tree, select "Neighbor-joining/UPGMA..." from the "Analysis" Menu. 

**COMMAND LINE USERS** Calcualting a neighbor-joining tree with default parameters is simply: `nj`




## Evaluating Molecular Substitution Models

There are many molecular substitution models to choose from, and each of them can have an effect on the best tree inferred. [Wikipedia has a thorough (if math-filled) explanation](https://en.wikipedia.org/wiki/Substitution_model) of common models. Choosing the best model often involves evaluating the "fit" of a model to the data. For simple models like linear regression, a correlation coefficient can be used. For the more complex models of phylogenetics, we use *likelihood*. 

`Pr( D | Ø, T)`

Where `D` is our data (DNA character matrix), `Ø` is the substitution model, and `T` is a phylogenetic tree. We are evaluating the "probability of the data given the model and the tree."

We will cover likelihood in more depth in future lessons. For today, we will compare the likelihood of different substitution models given the neighbor-joining tree you estiamted. 

To conduct the first likelihood calculation, change the "Criterion" to "Likelihood". 

**COMMAND LINE USERS**: `set criterion likelihood`

The likelihood score is a probability that is calculated at each site in the DNA matrix. Each probability is then multiplied together, so the scores are extremely small numbers. As a result, listed in units of "negative-log-likelihood." The closer the value is to 0 (i.e. probability = 1), the better the 

### Jukes-Cantor

The simplest time-reversable model of DNA substitution was described by [Jukes and Cantor in 1969](http://doi.org/10.1016/B978-1-4832-3211-9.50009-7). The model has the following assumptions:

* Base frequencies are equal (A = C = G = T).
* All substitutions have equal rates
* All sites have equal rates

Number of free parameters: 1 (rate of substitution) 

In the Graphical version of PAUP, the model settings can be specified in the "Likelihood Settings.." option in the Analysis menu. Be sure to explore all of the tabs to make sure you are setting the parameters correctly.


**COMMAND LINE USERS** First, set up the model:

`lset nst=1 basefreq=equal rates=equal`

Then, calculate the likelihood score using: `lscores`

You should see something like this:

```
Likelihood scores of tree(s) in memory:
---------------------------------------
  2895 characters are included
  All characters have equal weight
  Likelihood settings:
    Current model:
                             Data type = nucleotide
                DNA substitution types = 1
                     State frequencies = equal
        Proportion of invariable sites = none
               Rates at variable sites = equal
                  Model correspondence = JC69

    Number of distinct data patterns under this model = 700
    Molecular clock not enforced
    Starting branch lengths obtained using Rogers-Swofford approximation method
    Branch-length optimization = one-dimensional Newton-Raphson with pass limit=20, tolerance=1e-07
    Likelihood calculations performed in single precision
    Vector processing enabled
    Using standard Felsenstein pruning for computing likelihoods
    Conditional-likelihood rescaling threshold = 1e-20
    Using 1 thread on 6 physical (12 logical) processors

Tree             1
------------------
-ln L    12112.430
```
You can confirm that it is equivalent to Jukes/Cantor as it says `Model correspondence = JC69`. Note the likelihood score-- you will use this to compare to the other models.



### F81
One of the first modifications to the Jukes-Cantor model was to allow the base frequencies to differ. This reflects the biological reality that different organisms may have different G/C content, perhaps for environmental reasons. Usually, the "empirical base frequencies" are used, by estimating base percentages from the observed data. The model was first described by [Felsenstein in 1981](https://doi.org/10.1007%2FBF01734359). The assumptions are:

* Base frequencies are unequal (usually just uses the observed frequencies in the data)
* All substitutions have equal rates
* All sites have equal rates

Number of free parameters: 4 (rate of substitution, f(A), f(G), and f(T). f(C) is calcualted by subtraction).

**COMMAND LINE USERS** First, set up the model:

`lset nst=1 basefreq=empirical rates=equal`

Then, calculate the likelihood score using: `lscores`

How does the likelihood differ from JC69?


### HKY
The HKY model incorporates the observation that certain types of DNA substitutions are more likely to occur than others. The four DNA bases can be divided in to purines (A and C) and pyrimidines (G and T). Substitutions within a type (transitions) are more likely than across types (transversions), and this was first incorporated into a substitution model by [Hasegawa, Kishino and Yano, in 1985](https://dx.doi.org/10.1007%2FBF02101694). The model has these assumptions:

* Base frequencies are unequal.
* Unequal rates of transitions and transversions.
* All sites have equal rates

Number of free parameters: 5 (rate of substitution, f(A), f(G), f(T) and the ratio of transitions/transversions)

**COMMAND LINE USERS** First, set up the model:

`lset nst=2 basefreq=empirical rates=equal`

Then, calculate the likelihood score using: `lscores`


### GTR
The General-Time-Reversible model is the most complex of the DNA substitution models, allowing for different rates of change for all possible substitutions. Each rate is assumed to be reversible; the rate of change from A to T is the same as the rate from T to A. However, because of unequal base frequencies, the rates in the transition matrix may not be exactly equal. GTR was first described by [Tavare in 1986](http://www.damtp.cam.ac.uk/user/st321/CV_&_Publications_files/STpapers-pdf/T86.pdf) and has the following assumptions:

* Base frequencies ae unequal
* All substitutions have independent but reversible rates
* All sites have equal rates

Number of free parameters: 9 (f(A), f(G), f(T) and six rates of substitution)

**COMMAND LINE USERS** First, set up the model:

`lset nst=6 basefreq=empirical rates=equal`

Then, calculate the likelihood score using: `lscores`


### Adding Gamma
All of the above models share the assumption that every site in the DNA matrix evolves at the same rate. However, in many sequences used for phylogenetics, there may be tremendous variation in substitution rate. For example, protein-coding genes will have different rates depending on whether the site is synonymous (substitutions do not not change the encoded amino acid) or nonsynonymous (substitutions do change the encoded amino acid). Other sequences may include regions free of purifying selection, like introns.

To incorporate this variability, each site can have its rate chosen from a distribution of possible rates. The most frequently used distribution is _inverse gamma_ and the shape of the distribution is set by a parameter called *alpha*. This alpha parameter can be inferred from the data, and then each site is assigned to a portion of the resulting distribution. 

![](img/Gamma_distribution.png)

When the value of alpha is low, most sites will have a low substitution rate, while only a few sites will have fast rates. To reduce computational load, the distribution is broken into bins (traditionally, 4 bins, although more recently 20 bins is also common). Each site is assigned to a bin on the distribution.

**COMMAND LINE USERS** First, set up the model:

`lset nst=6 basefreq=empirical rates=gamma`

Then, calculate the likelihood score using: `lscores`


## Model Selection

You may have noticed that as you got more and more complex with each model, the likelihood scores always improved (got closer to 0). This is expected, and does not mean that the most complex model is the best fit. To evaluate among competing models, we use the Akaike Information Criterion (AIC), which weights the likelihood by the number of parameters.

Use this formula to calculate the AIC score of each model:

`AIC = 2L + 2K`

Where `k` is the number of free parameters in the model, and `L` is the negative-log-likelihood. In the example above with Jukes/Cantor, the negative-log-likelihood was `12112.430`. Because Jukes/Cantor has only one parameter, the AIC score would then be `24222.86`. How does this compare to the AIC value calculated from the other models?

How do you think the results would differ if a tree other than the neighbor-joining tree was used?

