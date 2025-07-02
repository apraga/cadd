CADD scores for use with datalad.

Only SNVs and indels without all annotations are included to reduce the size.

Chromosomes are numbered without any prefix (1, 2 ...). If your VCF is annoted
according to the "chr" reference, the CADD database must be renamed accordingly.
A script `rename_chr.sh` is available for that. It should take around 6hours and
is not parallelized. No temporary file will be created. It requires a reference
genome in `../genome-human/`, so
[the version of dgenomes](https://github.com/apraga/dgenomes/genome-human)
should be used.

Mirror of <https://kircherlab.bihealth.org/download/CADD/v1.7/GRCh38/COPYRIGHT>
(c) University of Washington, Hudson-Alpha Institute for Biotechnology and
Berlin Institute of Health at Charité - Universitätsmedizin Berlin 2013-2023.
All rights reserved.
