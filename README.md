# Vianna et al. 2020 chronograms for OpenTree curation

Code and data to rename the tip labels using species names of tree files from data package in https://datadryad.org/stash/dataset/doi:10.5061/dryad.pk0p2ngj2 from publication [Vianna et al. 2020. Genome-wide analyses reveal drivers of penguin diversification. PNAS 117 (36) 22303-22310; first published August 17, 2020; https://doi.org/10.1073/pnas.2006659117](https://www.pnas.org/content/117/36/22303)

### `R` folder

R code to change tip names from Vianna et al. 2020 trees

### `data-raw` folder

Original data downloaded on April 7, 2021.

Downloaded from https://datadryad.org/stash/dataset/doi:10.5061/dryad.pk0p2ngj2

### `data` folder
Renamed tree in newick format.

Chronogram in `data-raw/mitogenome_calibrated.tree` with original tip labels:

[1]                 AMNH17808 
[2]                AMNH211990 
[3]    G11_Eudyptes_schlegeli 
[4] G12_Eudyptes_chrysolophus 
[5] G17_Eudyptes_chrysolophus 
[6]   G13_Eudyptes_chrysocome 
[7]    G14_Eudypteschrysocome 
[8]       NC_0081381_Eudyptes 
[9]      G15_Eudyptesmoseleyi 
[10]                 MVZ149367 

Was renamed in `data/mitogenome_calibrated-renamed.tree` with:

[1]                 AMNH17808
[2]                AMNH211990
[3]    Eudyptes_schlegeli_G11
[4] Eudyptes_chrysolophus_G12
[5] Eudyptes_chrysolophus_G17
[6]   Eudyptes_chrysocome_G13
[7]   Eudyptes_chrysocome_G14
[8]       Eudyptes_NC_0081381
[9]     Eudyptes_moseleyi_G15
[10]                MVZ149367
