# SPECIES TREES
**BIOL6304: Principles of Phylogenetics**

## Learning Objectives

After completing this lesson, students will be able to:

1. Conduct a phylogenetic inference in BEAST using the multispecies-coalescent.
2. Use SVDQuartets to infer a phylogeny from a charater matrix in a method consistent under deep coalescence.
3. Compare parameterized and summary species tree methods to standard concatenation.


## Programs

* [PAUP](http://phylosolutions.com/paup-test/)
* [BEAST2](http://www.beast2.org/):
* [Tracer](https://github.com/beast-dev/tracer/releases)
* [FigTree](https://github.com/rambaut/figtree/releases)

## Bayesian inference of species trees

[Follow the the tutorial here](https://taming-the-beast.org/tutorials/StarBeast-Tutorial/) to run BEAST in *BEAST (pronounced "star-beast") mode. BEAST will jointly infer gene trees and species trees. The nexus files needed to run the tutorial can also be found in the BEAST2 folder.

You will need to install the starbeast3 package - you can do this from the "Manage Packages" option in the File menu. Note also that the menu options have changed - the "Multispecies Coalescent" settings have moved to the Priors tab.

When you are finished with the tutorial, compare your tree to `standard.tre` found in the files folder of the GitHub repository. This tree was inferred with the same matrix and substitution model, but with standard methods. The phylogeny is inferred with all genes assumed to share one history, as in the "concatenation" method. 

* How is the topology different?
* How are the support values different?
* How are these differences related to the "concatenation" versus "species tree" methods?

### SVDQuartets

The STAR-BEAST method is fully parameterized, which is useful in some circumstances to overcome issues relating to deep coalescence. However, it is not feasible to run STAR-BEAST with lots of loci. Many methods to accommodate large datasets use methods that provide consistent results in the presence of deep coalescence. One such method is SVDQuartets, implemented in PAUP.

The file `combined.nex` has the three genes combined into a concatenated matrix. However, SVDQuartets is different than other concatenated methods, as it treats each site (column) of the matrix independently. 

Open the `combined.nex` file in PAUP and execute it. Then, select the SVDQuartets analysis and evaluate all quartets, using a multilocus bootstrap (choose the "combined" partition defined in the Nexus file). 

**COMMAND LINE PAUP**

```
execute combined.nex
svdq evalq=all taxpartition=species nthreads=8 bootstrap=multilocus loci=combined
```

* How does this tree differ from the STAR-BEAST tree and the standard Bayesian tree?

