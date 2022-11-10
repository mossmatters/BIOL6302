library(ape)

primates.tree = read.tree(text="(Lemur_catta,((((((Homo_sapiens,Pan),Gorilla),Pongo),Hylobates),(((Macaca_fuscata,M_mulatta),M_fascicularis),M_sylvanus)),Saimiri_sciureus),Tarsius_syrichta);")
primates.tree
plot(primates.tree)
drop.tip(primates.tree,"Homo_sapiens")
write.tree(no.pongo.tree,file="nopongo.tree")

library(phytools)
data("anoletree")
tree=read.tree("data/anole.tre")
plot(tree)
x
tiplabels(pie=to.matrix(x,sort(unique(x))),piecol=cols,cex=0.3)
add.simmap.legend(colors=cols)
