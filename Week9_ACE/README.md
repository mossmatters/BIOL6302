# Ancestral State Reconstruction

## Learning Objectives
After completing these excercises, students will be able to:

* Reconstruct character states on phylogenies using parsimony and likelihood
* Evaluate how changes in model and tree affect ancestral state reconstruction


## Prerequisites 

Mesquite: [Download here](https://github.com/MesquiteProject/MesquiteCore/releases)

Data file: `bembidion.nex`: Morphological data from *Bembidion* ground beetles.

## Parsimony Reconstruction

The `bembidion.nex` file has Character states and trees for all taxa. Load the file into Mesquite and use the left sidebar to view both the character matrix and the trees. The first few trees are consensus trees, while the rest are fully bifurcating. We will use these trees to show how character state reconstruction can depend on the tree topology and branch lengths.

With one of the trees showing, right click on the tab for the tree viewer and select "Pop out as separate window." There will now be a separate set of menu options just above the tree, including **Analysis:Tree**.

In the **Analysis:Tree** menu, select "Trace Character History," and click OK. In the next window, select  "Parsimony Ancestral States".

The tree window will now display the character states for the first character mapped on to the current tree. There will be two sets of arrows, controlling either which tree is displayed, or which character is mapped. Use the arrows to navigate between trees and characters. If there is no definite answer for the ancestral state at a node, it will be listed as "equivocal."

### Setting the Parsimony Model
Each of the characters has a set Parsimony model describing the weightings of changes from one character state to another. You can view these by right clicking on the Matrix in the left sidebar and selecting "List and Manage Characters"

Some characters will be listed as *Ordered*, where character states will have a consecutive pattern. For example, a character with the states (1, 2, 3, and 4) will be scored as one change to go from 1 to 2, but two changes if the change is 1 to 3. Alternatively, the character may be scored *Unordered*, where every change is scored equally.

Select a character and then at the top of the list, click "Parsimony Model" and then change the model for that character. The change will show up immediately in the Tree window. Did the model change the reconstruction?

## Likelihood Reconstruction

One of the advantages of the likelihood reconstruction method is that models of character evolution can be evaluated in a hypothesis testing framework. The rate of change from one character state to another is referred to as the Q-matrix or transition matrix. A common use of likelihood is to test different models of the Q-matrix, for example:

* All-rates-Equal: for a binary character, the rate from 0 -> 1 is the same as the rate from 1 -> 0
* Asymmetric Rates: for a binary character, the rate from 0 -> 1 is allowed to have a different rate than changes from 1 -> 0

Since the all-rates-equal method is a simplified version of the asymmetric rates model, they can be directly compared using a Likelihood Ratio Test.

Likelihood ancestral state reconstruction also provides an probability estimate of ancestral rates at each node.

### Setting the likelihood model

In Mesquite, return to the tree window. In the Display menu, select Tree Form, and then "Balls and Sticks". This view will be more useful for showing the probabilities of character states at ancestral nodes.

Repeat the process of tracing character states on the tree:

1. Select "Trace Character Over Trees" in the Analysis:Trees menu.
2. Select "Likelihood Ancestral States"
3. Select "Stored Probability Model"
4. Select "Mk1 (est)." This is the all-rates-equal model.

Because polymorphic taxa are not supported by Mesquite, you will need to navigate to one of the characters without polymorphic data (for example, characters 1 or 44 or 53). If you hover over any of the circles on the ancestral nodes, you will see a probability estimate for each character state at that node. Are there any nodes where the probability is less than 90%?

One tree/trait comparison to look at is tree #5 with character #1. Expand the Trace Character inset until you can see the log likelihood values. Note the value, and then repeat the above process with the Asymmetric model. How different is the asymmetric model? Would you consider this a significant difference, justifying the use of an extra parameter?

### Exercise
Look through the characters and trees and see if you can find a scenario where the likelihoods of the two models are substantially different. Are the character state probabilities at ancestral nodes different between the two models?
