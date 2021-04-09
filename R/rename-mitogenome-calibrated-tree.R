# Downloading the tree

download.file("https://datadryad.org/stash/downloads/file_stream/690496", "data-raw/mitogenome_calibrated.tree")

# Reading the tree in

phy <- ape::read.nexus("data-raw/mitogenome_calibrated.tree")

# Writing the tip labels and matching new names down to a file

new_tip_labels <- c(phy$tip.label[1:2],
  "Eudyptes_schlegeli", #3
  "Eudyptes_chrysolophus", #4
  "Eudyptes_chrysolophus", #5
  "Eudyptes_chrysocome", #6
  "Eudyptes_chrysocome", #7
  sapply(strsplit(phy$tip.label[8], "_"), "[", 3), #8
  "Eudyptes_moseleyi", #9
  phy$tip.label[10:11],
  "Spheniscus_demersus", #12
  "Spheniscus_magellanicus", #13
  "Spheniscus_magellanicus", #14
  "Spheniscus_mendiculus", #15
  "Spheniscus_humboldti", #16
  "Spheniscus_humboldti", #17
  "Spheniscus_mendiculus", #18
  "Eudyptula_minor", #19
  "Eudyptula_minor", #20
  "Pygoscelis_papua", #21
  "Pygoscelis_papua", #22
  "Pygoscelis_papua", #23
  "Pygoscelis_papua", #24
  "Pygoscelis_papua", #25
  "Pygoscelis_antarcticus", #26
  "Pygoscelis_antarcticus", #27
  "Pygoscelis_adeliae", #28
  "Pygoscelis_adeliae", #29
  phy$tip.label[30], #30
  "Aptenodytes_forsteri", #31
  "Aptenodytes_patagonicus", #32
  phy$tip.label[33]  #33
  )

csv <- paste0(c("original", phy$tip.label), ",", c("renamed", new_tip_labels))

write(csv, file = "data/tip_labels.csv")

# Reading the file in

tips <- read.csv(file="data/tip_labels.csv", header = TRUE)

head(tips)

# Renaming the tips

## Matching the tip labels to column of original tip names
ii <- match(phy$tip.label, tips$original)

## Replacing the original tips for the new tips

phy$tip.label <- tips$renamed[ii]

# Writing the tree file down

ape::write.tree(phy, file = "data/mitogenome_calibrated_renamed.tree")





