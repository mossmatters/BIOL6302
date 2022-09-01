
# Week 1: Tree Thinking

### BIO6304 Principles of Phylogenetics, Texas Tech University
Instructor: Dr. Matt Johnson, Ph.D.



## Exercise 1: Tree comparison in FigTree

In this exercise you will work with real phylogenetics data to examine the differences between types of phylogenetic trees.

### Programs to download
FigTree: [https://github.com/rambaut/figtree/releases](https://github.com/rambaut/figtree/releases)

Select the `.dmg` if you are on MacOSX. For Windows, use the `.zip`, and use the `tgz` for Linux. FigTree requires that Java is installed on your computer.


### Files to download
Download the phylogenetic tree files [from the course GitHub:](https://github.com/mossmatters/BIOL6304/tree/master/Week1_TreeThinking)

These phylogenetic trees show the relationships in _Artocarpus_, a genus of trees from Southeast Asia that includes several underutilized crop species such as Jackfruit and Breadfruit. The trees you will be working with were inferred from DNA sequence data from [Kates et al., 2019, American Journal of Botany. ](https://datadryad.org/stash/dataset/doi:10.5061/dryad.r8q72).

### Viewing Phylogenies in FigTree

Open FigTree and select "open" from the File menu. Select the `artocarpus_onegene.tre` file and open it. FigTree may prompt you to identify the name of the support values. Type `Bootstrap` and hit `OK`. 

The tree figure that appears is a **phylogram**. The length of the branches represent amount of evolution. It is usually easy to spot a phylogram because the terminal branches (aka "leaves" or "tips") do not all line up neatly on one side of the phylogeny.

The default view is also a rectangular shape for the phylogram, with the root of the tree to the left and the tips of the tree to the right. FigTree also allows two other shapes: circular and unrooted. You can choose these view options in the sidebar under Layout. This section also has controls for the Zoom and Expansion of the tree, which can be useful for viewing large phylogenies.

The tree is imported as **unrooted**, because the output of the tree software used to infer the tree is unrooted trees. By convention, you can tell that a tree is unrooted because there will be a **trifurcation** at the root of the tree (three branches descending from the left-most node). View the tree in unrooted mode by clicking the button in the Layout sidebar. When looking at an unrooted tree, we cannot tell the direction of evolution, but we can still infer *bipartitions*.

The _Artocarpus_ phylogeny was inferred using an **outgroup** - a species outside the group of interest (or **ingroup**). Here, the species _Streblus_glaber_ was used. Return to the rectangular view in the Layout sidebar, and then click on the branch leading to _Strebulus_glaber_EG78_. Next, click on the `Reroot` button in the top bar of FigTree. The tree will re-orient to show an outgroup and a monophyletic ingroup.

In some situations, you are only interested in the topology of the phylogenetic tree, not the branch lengths. In this case, you want to view a **cladogram**. In FigTree, this can be done in the Trees section of the sidebar. Click the arrow next to Trees to expand it, and then click the checkbox next to `Transform branches` and make sure `Cladogram` is selected in the dropdown menu.

FigTree allows you to select different features of the tree by clicking. You control which feature you are selecting at the top middle of the screen, with three selection modes: `Node`, `Clade`, and `Taxa`. Select the `Node` feature now, and click on one of the nodes on the phylogeny. In lecture, we discussed how changing the visualization of a phylogeny will not affect the phylogenetic relationships. Confirm this for yourself by clicking on a Node and then clicking the `Rotate` button at the top left of the screen. 


### Annotating a Phylogenetic Tree

FigTree has many features for annotating a phylogenetic tree. One common task is to identify different species by characteristic. After selecting something in FigTree, you can click on `Colour` to choose a color. What is colored will depend on whether you are in Node, Clade, or Taxa selection mode.

Use the following table to color-code the Taxa in the Artocarpus phylogeny by subgenus:

**Sample ID**|**Species**|**Subgenus**
:-----:|:-----:|:-----:
NZ866|Artocarpus odoratissimus|Artocarpus
NZ728|Artocarpus rigidus|Artocarpus
NZ739|Artocarpus lanceifolius|Artocarpus
NZ606|Artocarpus anisophyllus|Artocarpus
NZ814|Artocarpus brevipedunculatus|Artocarpus
NZ612|Artocarpus kemando|Artocarpus
EG92|Artocarpus tamaran|Artocarpus
EG87|Artocarpus elasticus|Artocarpus
NZ771|Artocarpus sericicarpus|Artocarpus
NZ946|Artocarpus teysmannii|Artocarpus
MWL2|Artocarpus lowii|Artocarpus
McBryde|Artocarpus camansi|Artocarpus
NZ780|Artocarpus excelsus|Artocarpus
NZ918|Artocarpus integer|Cauliflori
EG98|Artocarpus heterophyllus|Cauliflori
NZ694|Artocarpus peltatus|Pseudojaca
NZ687|Artocarpus primackiana|Pseudojaca
NZ420|Artocarpus lacucha|Pseudojaca
NZ911|Artocarpus nitidus|Pseudojaca
NZ402|Artocarpus thailandicus|Pseudojaca
NZ929|Artocarpus fretessii|Pseudojaca
GW1701|Artocarpus sepicanus|Prainea
NZ609|Artocarpus limpato|Prainea


### Questions 
1. What species is sister to the Jackfruit, _Artocarpus heterophylla_? Hint: it could be more than one!
1. Rotate the nodes of the phylogeny so that the two species of subgenus _Prainea_ appear next to each other on the tree.
1. Are all of the subgenera monophyletic?
2. Which subgenus has the least amount of molecular evolution?



## Exercise 2: Tree Thinking Assessment


These exercises are modified from [Baum, Smith, and Donovan (_Science_, 2005)](https://science.sciencemag.org/content/310/5750/979).

Download the files from Week 1: Tree Thinking on [Github](github.com/mossmatters/BIOL6304). Working in groups, answer the assessment questions. If you are not sure of some of the answers, that is perfectly fine! This is a pre-assessment, and the goal is that each of these will seem easy by the end of the course!