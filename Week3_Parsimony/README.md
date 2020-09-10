# Inferring Phylogenies with Parsimony
### BIOL6304: Principles and Practice of Phylogenetics 

In-Class Exercise

## Learning Objectives
After completing this activity, students will be able to:

1. Construct a NEXUS file with a phylogenetic character matrix.
2. Infer a phylogeny using maximum parsimony.
3. Describe the effect of weighted characters on phylogenetic inference.
4. Construct systematic hypotheses based on character similarity.

## Introduction
As we learned in lecture, inferring a phylogeny for more than a few taxa is a complex process. In this exercise, you will use maximum parsimony to infer a phylogeny from a morphological character matrix. You will learn two different ways of searching for the most parsimonious tree, and how to compute a consensus tree. You will also explore the effect of character state weighting on parsimony inference. Finally, you will use parsimony character state reconstruction to infer the evolution of character states along a phylogeny.

## Constructing a NEXUS file
One standard file format is the NEXUS file, which is a plain text file that can contain both phy- logenetic data (i.e. the character matrix and/or tree) and instructions for conducting analyses. A NEXUS file is split into blocks containing data or instructions. By convention, the NEXUS file usually ends with the extension `.nex` or `.nexus`.

For this lession we will use some categorical data from *Anolis* which can be downloaded from this link.

**NOTE**: You should only edit a NEXUS file with a plain text editor such as Notepad++ or BBEdit, or with a command-line editor such as vim or nano. This goes for most files in bioinformatics; using word processors including Microsoft Word and regular Notepad can result in files that are unreadable by phylogenetics software, even if you “save as” a text file. The NEXUS file can also be edited directly within PAUP (GUI Version), as we will see in the next section.

The example below is a minimal NEXUS file with one block, data.

```
#NEXUS

begin data;
dimensions ntax=10 nchar=16;
format datatype=standard symbols="0 1 2";


MATRIX
Anolis_outgroupus				0000000000000000
Anolis_acutus                   0021021121101101
Anolis_aeneus                   0000011111102101
Anolis_agassizi                 0000011111102101
Anolis_bahorucoensis            0121011121121111
Anolis_barahonae                1021022121121101
Anolis_bartschi                 1021012121101111
Anolis_bimaculatus              1021012121101100
Anolis_carolinensis             2021012111101110
Anolis_cuvieri                  2021022111101102
;
END;
```

Some important notes about the NEXUS format:

- The file always begins with the `#NEXUS` identifier.
- Commands must end with a semicolon: `;`
- The type of data (i.e. standard, DNA, protein, continuous) and size of character matrix must
be specified.
- The character matrix must be aligned. If the species names have different numbers of char- acters, adjust the position of the first character accordingly.
- The data block ends with the `end;` command.
- A complete description of the NEXUS file format can be found [at this link](http://informatics.nescent.org/w/images/8/8b/NEXUS_Final.pdf).



## PAUP: Phylogenetic Analysis Using Parsimony
One of the most popular phylogenetics packages is PAUP, written primarily by David Swofford. The program and manual have served as a de facto textbook for phylogenetics for many years. PAUP can be run from the command line only on Windows. If you are using MacOS or Linux, you will need to use the command line version. Instructions will be given for both versions at each step.

Although Parsimony is in the name of the program, PAUP does implement other criteria for inferring phylogenies, including distance and likelihood methods. PAUP can also be used to assess support using the bootstrap, conduct hypothesis tests, and summarize phylogenies. It can accom- modate character matrices with many different types of data, including DNA and proteins along with standard categorical and continuous data.

### 0. Installing PAUP

To install PAUP on your own computer, it is available for free [at this link](http://phylosolutions.com/paup-test/).

When you first open PAUP, you will see a screen like this. Commands may be entered directly into the command prompt at the bottom of the screen, or they may be executed using menu options in the GUI version.

If you downloaded using the command line version, you will need to use a Terminal. On a Mac, the Terminal.app is located in a Utilities folder inside your Applications folder. Open the Terminal app and navigate to where you downloaded paup. For example, if you downloaded it to your Downloads folder, do:

`cd ~/Downloads`

Next you will need to make paup an executable program. First, if you have not unzipped the downloaded file:

`gunzip paup4a168_osx.gz`

To make the program executable, enter this command:

`chmod +x paup4a168_osx`

Now you can start paup with this command:

`./paup4a168_osx`

If you get a warning that the program cannot be opened because it is from an unidentified developer, click "Cancel" and open System Preferences. Navigate to Security & Privacy and in the general tab there will be a button to "Open Anyway." Click this button, and then re-enter the `./paup4a168_osx` command. You should then see a window like this:

```
P A U P *
Version 4.0a (build 168) for macOS (built on Aug  2 2020 at 06:41:30)
Thu Sep 10 14:01:14 2020

        -----------------------------NOTICE-----------------------------
          This is a test version that is still changing rapidly.
          Please report bugs to dave@phylosolutions.com
        ----------------------------------------------------------------

Running on Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
    6 CPU cores on 1 socket (hyperthreaded to 12 logical cores)
    Executable built for Intel(R) 64 architecture
    Compiled using Intel compiler (icc) 11.1.0 (build 20091012)
    SSE vectorization enabled
    SSSE3 instructions supported
    Multithreading enabled using Pthreads

paup>
```

Your cursor will be placed where it says `paup>`. This is referred to as the "command prompt" and is where you will enter all of the commands as specified below.


### 1. Loading data into PAUP

To use PAUP, data must be loaded from a NEXUS file. Use the Open command in the File menu, and select your NEXUS formatted file. The file will open in the PAUP text editor, but the data is not yet available for analysis.

The first step is to Execute the file. This command can also be found in the File menu, or you can use Ctrl-R. PAUP will give an error if there is a problem with the format of the NEXUS file. If you get an error, check your NEXUS file carefully to make sure all of the parts are in place.
When your file is successfully loaded, you will see output that looks something like this:

```
Processing of file "anolis.nex" begins...Data matrix has 10 taxa, 16 characters 
Valid character -state symbols: 012 Missing data identified by ’?’
Processing of input file "anolis.nex" completed.
```

### COMMAND LINE MAC VERSION:

If you are using the command line version of paup, the command to execute a new file is `execute` followed by the name of the file. An easy way to do this is to navigate to where the file is in your Finder and drag and drop the file into the Terminal window:

```
paup> execute '/Users/joh97948/OneDrive - Texas Tech University/Courses/BIOL6304/Parsimony_InClass/anolis.nex'

Processing of file "~/OneDrive - Texas Tech University/Courses/BIOL6304/Parsimony_InClass/anolis.nex" begins...

Data matrix has 10 taxa, 16 characters
Valid character-state symbols: 012
Missing data identified by '?'

Processing of input file "anolis.nex" completed.
```

### 2. Running Parsimony Inference

PAUP has three inference modes: Parsimony, Distance, and Likelihood. The current inference mode is indicated by a checkmark in the "Analysis" menu. For today’s exercises, make sure the mode is set to Parsimony. **COMMAND LINE VERSION**: Alternatively, the mode can be changed by entering the command: `Set criterion=parsimony;`

First, let’s conduct an Exhaustive search, which we know is only feasible with up to 10 taxa. In the "Analysis" menu, select "Exhaustive Search..." A window will appear with options:

[!](images/ExhaustiveSearch.png)

It is always a good idea to check on the default settings, but in this case we will leave them all as is. Click "Search" to begin the search. A new window will appear showing the progress of the search: how many trees it has already searched, what the current shortest (most parsimonious) tree score is, and how many trees share that best score.

**COMMAND LINE VERSION**: The command `AllTrees;` will conduct an exhaustive search. To see what the default settings are for the parsimony search, use the command: `AllTrees ?`:

```
paup> AllTrees ?

Usage: allTrees [options...];

Available options:

Keyword ------- Option type -------------------------------------- Current setting -----------------
keep            <real-value>|No                                    No
enforce         no|yes                                             no
constraints     <constraint-name>                                  (none)
converse        no|yes                                             no
scoreFile       <filename-for-scores>                              none
fd              none|histogram|barChart                            histogram
fdClasses       <integer-value>                                    20
fdFile          <freq-distrib-filename>                            none
replace         no|yes                                            *no
statusWin       no|yes                                             yes
dStatus         <integer-value>|none                               60
                                                                  *Option is nonpersistent

paup>
```

For now we will leave all the parameters the same, so simply run the command `AllTrees;`.

Whether using GUI or Command line, you will see an output like this:

```
paup> AllTrees;

Exhaustive search settings:
  Optimality criterion = parsimony
    Character-status summary:
      Of 16 total characters:
        All characters are of type 'unord'
        All characters have equal weight
        1 character is constant (proportion = 0.0625)
        5 variable characters are parsimony-uninformative
        Number of parsimony-informative characters = 10
  Initial 'Maxtrees' setting = 100
  Branches collapsed (creating polytomies) if maximum branch length is zero
  'MulTrees' option in effect
  No topological constraints in effect
  Trees are unrooted

Exhaustive search completed:
  Number of trees evaluated = 2027025
  Score of best tree found = 28
  Score of worst tree found = 42
  Number of trees retained = 8
  Time used = 0.30 sec (CPU time = 0.29 sec)

Frequency distribution of tree scores:

        mean=38.496059 sd=2.056546 g1=-0.917808 g2=0.962088
       /-----------------------------------------------------------------------------------------------
28.000 | (27)
28.737 | (285)
29.474 | (0)
30.211 | (1666)
30.947 |# (6301)
31.684 |### (14321)
32.421 | (0)
33.158 |###### (30814)
33.895 |########### (52054)
34.632 | (0)
35.368 |################ (79315)
36.105 |######################### (120470)
36.842 |############################################ (214052)
37.579 | (0)
38.316 |###################################################################### (343964)
39.053 |############################################################################################### (466718)
39.789 |################################################################################### (409160)
40.526 | (0)
41.263 |############################################### (229606)
42.000 |############ (58272)
       \-----------------------------------------------------------------------------------------------

paup>
```

The y-axis shows the parsimony score, and the x-axis shows the number of trees with that score. How many trees share the most parsimonious score?

### 3. Showing Trees in PAUP

Trees can be displayed in two ways within the GUI version of PAUP. They can be shown in a text (ASCII) format, or saved to a file to be opened by another viewer like FigTree. The GUI version can also display trees and save them as a PDF. 

In the Trees menu, select Show Trees... to print the trees to the screen in ASCII format. A window will appear to ask you which trees you wish to show. You may select all of them, or only a subset.

```
/------------------------------------------------------------------------------------------ Anolis outgroupus
|
|                                 /-------------------------------------------------------- Anolis acutus
|                                 |
|                      /----------+          /--------------------------------------------- Anolis barahonae
|                      |          |          |
|                      |          \----------+          /---------------------------------- Anolis bartschi
|                      |                     |          |
|                      |                     \----------+           /---------------------- Anolis bimaculatus
|          /-----------+                                |           |
|          |           |                                \-----------+          /----------- Anolis carolinensis
|          |           |                                            \----------+
|          |           |                                                       \----------- Anolis cuvieri
\----------+           |
           |           \------------------------------------------------------------------- Anolis bahorucoensis
           |
           |                                                                   /----------- Anolis aeneus
           \-------------------------------------------------------------------+
                                                                               \----------- Anolis agassizi
```


A more flexible way of viewing the tree uses the Print/View Trees function in the Tree menu. In the window that appears, you can view each tree individually and set a number of options, including:

- whether the tree is rectangular, diagonal, circular, or unrooted 
- whether to plot the tree as a phylogram or cladogram
- options for text size, fonts, line widths, and titles
When you are satisfied with your tree image, you can save the tree image as a PDF.

**COMMAND LINE VERSION** You can view the trees using the command: `ShowTrees;`

By default, this will only show the top tree in memory. However, you may have more than one most-parsimonious tree. To show all the trees, use: `ShowTrees all;`

### 4. Setting the outgroup

You may have noticed in the previous section that PAUP indicated the outgroup was arbitrarily set as the first taxon in the character matrix, in our case _Anolis outgroupus_. The outgroup may not always be the first taxon, or there may be additional taxa in the outgroup. To set this, use the "Set outgroup" function in the "Data" menu. Move one or more taxa from the Ingroup to the Outgroup and click OK to save.

Once the outgroup is changed, you will need to repeat all tree visuals to incorporate the new root for the tree.

**COMMAND LINE VERSION** The command to set the outgroup is: `outgroup taxon` where `taxon` is either names or numbers corresponding to the taxa in the outgroup. For example, to use _Anolis bimaculatus_ as the outgroup (the single quotes are important because of the space in the species name): 

`outgroup 'Anolis bimaculatus';`

Now re-run `ShowTrees all;` to see how the alternative rooting has changed the trees.


### 5. Computing a consensus tree

It is likely that your Exhaustive Search resulted in more than one equally parsimonious tree. As you look through these trees, you may notice substantial differences. Which clades should we believe?

One way of assessing support for clades when given multiple possible trees is to compute a consensus tree. This can be done in PAUP by selecting "Compute consensus" in the "Trees" menu.

The Strict consensus will retain only clades that appear in all trees, while the Majority-rule consensus will retain clades that occur in at least 50% of trees. If you select the Majority-rule consensus, you can set the threshold to be higher than 50%, and the exact percentage will be plotted on the branches of the phylogeny.

**COMMAND LINE VERSION** The command to compute a consensus is `contree;`. To view the options, use `contree ?`, which indicates that `contree` will compute a strict consensus by default. To calculate a majority rule consensus, use: `contree all/strict=no majrule=yes`


The Majority-rule consensus will also output a report of all bipartitions found on the selected trees:

```
Bipartitions found in one or more trees and frequency of occurrence:

         1
1234567890          Freq        %
---------------------------------
........**             8  100.00%
.......***             8  100.00%
.....*****             8  100.00%
.*..******             8  100.00%
......****             4   50.00%
....******             4   50.00%
..**......             4   50.00%
.....*.***             2   25.00%
.*...*****             2   25.00%

paup>
```

This table can be read by row– taxa in a given bipartition are shown as asterisks. In the example above, a bipartition containing taxa 9 and 10 is found in all 8 trees, while a bipartition containing taxa 6, 8, 9, and 10 appears in only 2 trees.

### 6. Saving Trees

PAUP stores trees in memory until they are overwritten. To save one or more of the equally par- simonious trees to a file, use the "Save trees to file" option in the "Trees" menu. 

**COMMAND LINE VERSION** To save the trees to a file, use `savetrees file=trees.nex`. This will save the tree file to the same directory that PAUP is in.


PAUP will save the trees in a NEXUS file that has a trees block, which will look something like this:

```
#NEXUSBegin trees; Translate
1 Anolis_outgroupus ,
2 Anolis_acutus ,
3 Anolis_aeneus ,
4 Anolis_agassizi ,5 Anolis_bahorucoensis ,
6 Anolis_barahonae ,
7 Anolis_bartschi ,
8 Anolis_bimaculatus ,
9 Anolis_carolinensis ,
10 Anolis_cuvieri;
tree ’PAUP_1’ = [&U] (1,(2,5,(6,7,(8,(9,10)))),3,4);
tree ’PAUP_2’ = [&U] (1,(2,(5,(6,(7,(8,(9,10)))))),3,4);
```

The trees block begins with a translation table between taxon names and an integer. This is done for readability and to check for errors.
The tree topologies are saved in a parenthetical notation known as Newick format. This computer readable format is a universal style used by nearly all phylogenetic software.
The tree block can be added to the original NEXUS file, and would be stored into memory if loaded into PAUP. The Newick tree format can also be stored on its own without the NEXUS formatting. We will see an example of this in a future exercise.


### 7. Character Weighting

The search you have just completed assumes the character states are unordered and equal weight. That means that a change from `0` to `1` is assigned the same weight as a change from `1` to `0` for the same character. This is commonly referred to as *Dollo parsimony*. 

Other schemes for assessing character state change exist, and these can be set in PAUP using the "Set Character Types" command in the "Data" menu. Select a character and change a few of the characters from *Unordered* to *Irrev.Up*. 

**COMMAND LINE VERSION** To change the character weighting for one or more characters, use the command `ctype`. You can specify which type to change to and select characters by their position in the matrix. For example, to change the first four characters to *Irrev.Up*, use `ctype IRREV.UP:1-4`

Repeat your parsimony search. Did it change the number of equally parsimonious trees? Is the topology of the consensus tree different?


## Caminacules Phylogenetics

### 1. Creating a character matrix in Mesquite

Now that you have some experience working with an existing NEXUS file, it is time to work on building a NEXUS file from the characters you recorded on the Caminalcules last week.

Open Mesquite and select "New" from the "File" menu. It will prompt you with a few options, such as the number of taxa. Click the "Make Character Matrix" option. After hitting OK you will then need to specify the number and type of characters-- for the Caminacules project you used Standard Categorical Data.

Each window in Mesquite has its own menu options. For example in the character matrix window youcan select Matrix / Add characters if you need to add more.

Using the matrix you created last week, enter the character data for the Caminacules. When you are finished, save the file and return to PAUP. 

Execute your new Nexus file.

### 2. Heuristic search

Inferring a phylogeny with 20 or more taxa is not feasible with either the Exhaustive Search or Branch and Bound options. Instead, we will need to conduct a Heuristic Search for the most parsimonious trees.

Select Heuristic Search from the Analysis menu. A window will appear with several tabs. Using the default settings, PAUP will:

- Save only trees with the maximum parsimony score (General Tab) 
- Assemble the first trees by stepwise addition (Starting Trees Tab) 
- Create only one (simple) starting tree (Stepwise Addition Tab)
- Swap trees using the TBR algorithm (Branch Swapping Tab)

**Command line version**: The `hsearch` command will execute a Heuristic search. Use the `hsearch ?` command to see all the options. We will first execute a default search with `hsearch;`

By default, PAUP will only store 100 trees; if the number of equally parsimonious trees exceeds this, you will be prompted to increase MaxTrees. You can select the Automatically increase MaxTrees option to continue. When complete, PAUP will store all of the equally parsimonious trees. How many trees are there? What is the parsimony score?

### 3. Multiple searches

As we saw in lecture, the Heuristic Search is a “hill-climbing problem,” and the search may get “stuck” in a local optimum. The solution to this problem is to start with many different trees. Start a new Heuristic Search and on the Stepwise Addition Tab, select the random option. Use 100 random stepwise addition trees and conduct a new search.

**Command line version**: Specify `hsearch addseq=random nreps=100;` to conduct the search described above.

In the new search, did PAUP find a shorter tree than before?

Compute a majority rule consensus tree and save this tree to a file.


### 4. Character Weighting

We saw earlier that you can specify different models for the chracter evolution. You can also specify a custom scheme for weighting different character state transitions. To do this, you will need to add a new block to the NEXUS file using a text editor. For example, an assumptions blcok that specifies different weights for Transitions and Transversions in a DNA matrix could be: 

```
begin assumptions;
usertype my_ctype stepmatrix=4
ACGT 
[A] . 2 1 2 
[C] 2 . 2 1[G] 1 2 . 2 
[T] 2 1 2 . ;
end;
```
You may wish to define assumptions blocks for your Caminacules prjoect; if so, ask the instructor for more information.

## Character Evolution in Mesquite

Open your character matrix in Mesquite, and then in the menus select "Taxa&Trees", then "Import File with Trees" and then "Include Contents". Select your tree file from PAUP. Mesquite will ask what the numbers indicate, so select the Consensus option.

When the tree loads, you may view it by clicking on the Trees icon on the far left side of the Mesquite window. With the tree window open, go to the Analysis::Tree menu and select Trace Character History. Mesquite will ask by which method you want to infer character state evolution; select Parsimony.

In the tree window, you will then see the evolution of the first character mapped onto the phylogeny. Using the blue arrows, you can navigate to all of your characters to see their evolution based on this tree. Colors and other options can be adjusted using the tools on the left side of the screen. You can create a PDF from any window in the File menu.

Are there any surprising results to the character evolution analysis? Are there homoplasious character states? You will discuss the results of this analysis in greater detail in your short paper, due at the end of the month.

