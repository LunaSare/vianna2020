# Downloading the tree

download.file("https://datadryad.org/stash/downloads/file_stream/690496", "data-raw/mitogenome_calibrated.tree")

# Reading the tree in

phy <- ape::read.nexus("data-raw/mitogenome_calibrated.tree")

# Looking at the tip labels

phy$tip.label

## Fixing tip labels by hand because there is no table linking to species names
## Leaving a unique identifier at the end because OpenTree does not accept duplicated labels

new_tip_labels <- c(phy$tip.label[1:2],
  "Eudyptes_schlegeli_G11", #3
  "Eudyptes_chrysolophus_G12", #4
  "Eudyptes_chrysolophus_G17", #5
  "Eudyptes_chrysocome_G13", #6
  "Eudyptes_chrysocome_G14", #7
  "Eudyptes_NC_0081381", #8
  "Eudyptes_moseleyi_G15", #9
  phy$tip.label[10:11],
  "Spheniscus_demersus_NC_022817_1", #12
  "Spheniscus_magellanicus_G3", #13
  "Spheniscus_magellanicus_NC_036264_1", #14
  "Spheniscus_mendiculus_G1", #15
  "Spheniscus_humboldti_NC_036337_1", #16
  "Spheniscus_humboldti_G2", #17
  "Spheniscus_mendiculus_KU361807_1", #18
  "Eudyptula_minor_G16", #19
  "Eudyptula_minor_NC_004538_1", #20
  "Pygoscelis_papua_G4", #21
  "Pygoscelis_papua_NC_037702_1", #22
  "Pygoscelis_papua_G5", #23
  "Pygoscelis_papua_G6", #24
  "Pygoscelis_papua_G7", #25
  "Pygoscelis_antarcticus_G8", #26
  "Pygoscelis_antarcticus_KU356674_1_", #27
  "Pygoscelis_adeliae_G9", #28
  "Pygoscelis_adeliae_KU356676_1", #29
  phy$tip.label[30], #30
  "Aptenodytes_forsteri_KT159230_1", #31
  "Aptenodytes_patagonicus_G10", #32
  phy$tip.label[33]  #33
  )

csv <- paste0(c("original", phy$tip.label), ",", c("renamed", new_tip_labels))

write(csv, file = "data/tip_labels.csv")

# Reading the csv file in

tips <- read.csv(file="data/tip_labels.csv", header = TRUE)

head(tips[,1], 10)

# Renaming the tips

## Matching the tip labels to column of original tip names
ii <- match(phy$tip.label, tips$original)

## Replacing the original tips for the new tips

phy$tip.label <- tips$renamed[ii]

# Writing the tree file down

ape::write.tree(phy, file = "data/mitogenome_calibrated-renamed.tree")





