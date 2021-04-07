# Downloading the tree

download.file("https://datadryad.org/stash/downloads/file_stream/690496", "data-raw/mitogenome_calibrated.tree")

# Reading the tree in

phy <- ape::read.nexus("data-raw/mitogenome_calibrated.tree")

# Writing the tip labels down to a file

c(phy$tip.label[1:2],
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
  lapply(strsplit(phy$tip.label[21], "_"), "[", -1)
  )

paste0(phy$tip.label, ",\t\n")



