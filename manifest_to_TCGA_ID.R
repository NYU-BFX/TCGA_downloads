#!/usr/bin/env Rscript


#Info frm 
#https://www.bioconductor.org/packages/release/bioc/vignettes/TCGAutils/inst/doc/UNC12-SN629_0322.html#uuid-to-tcga-barcode
library(TCGAutils)

#Accepts 1 argument which is the name of the manifest file(Sorry no checks)
args = commandArgs(trailingOnly=TRUE)

manifest <- read.table(args[1], header=TRUE, sep="\t")
file_uuids <- manifest$id

for (f in  file_uuids){
        result = UUIDtoBarcode(f, id_type = "file_id")
        print (paste(result$file_id, result$cases.submitter_id , sep = " "))
}
