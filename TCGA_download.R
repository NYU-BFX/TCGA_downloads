library(TCGAbiolinks)
library(TCGAutils)
library(dplyr)
library(data.table)
#https://bioconductor.riken.jp/packages/3.3/bioc/vignettes/TCGAbiolinks/inst/doc/tcgaBiolinks.html
#data <- GDCprepare(query)
#setwd("GDCdata/TCGA-LUAD/harmonized/Transcriptome_Profiling/Gene_Expression_Quantification/")
#file <- list.files("GDCdata/TCGA-LUAD/harmonized/Transcriptome_Profiling/Gene_Expression_Quantification/", recursive = TRUE, full.name = TRUE)


kras_g12 <- function(kras, tcga_barcodes){
	inner_join(kras_g12, tcga_barcode)

}


#Function to find TCGA barcodes from the IDS generated 
find_TCGAids <-function (path){
        #file<- list.files(path)
	mylist <- data.frame()
	count = 0
	setwd("GDCdata/TCGA-LUAD/harmonized/Transcriptome_Profiling/Gene_Expression_Quantification/")
	#Gives the full file name 
	#file1<-list.files(path,  recursive = TRUE, full.name = TRUE)


	
        for (i in path[[1]]){
		#tcga_barcode = subset(tcgaids, grepl(i, tcgaids, perl = TRUE))
		#print (tcga_barcode)
		#print (typeof(tcga_barcode))
		file2<-list.files(i,  recursive = TRUE)
		tcga_barcode = toString(unlist(path[which(path[[1]] == i ),][2]))
		#print (typeof(tcga_barcode))
		newfile = paste(i,file2, sep="/")
		#print (paste("This is it ", newfile))
		dat <- fread(newfile, select = c(2))
		genes <- fread(newfile, select =c(1))
		#print (genes)
		#mylist <- rbind(mylist, dat)
		new_df <- data.frame(unlist(dat))
		#print (UUIDtoBarcode(i,id_type = "file_id"))
		#tcga_barcode = (UUIDtoBarcode(i,id_type = "file_id"))
		#print (toString(tcga_barcode))
		colnames(new_df) = tcga_barcode
		if (count == 0 ){
			first_col = data.frame(unlist(genes))
			colnames(first_col) = "Genes"
			#first_col <- lapply(first_col, function(x) (gsub("'.\\d+", "", x)) )
			mylist <- cbind(first_col, new_df)
			#mylist <- new_df
		}else{
		mylist <- cbind(mylist, new_df)

		}
		count <- count + 1
		
                #tcga_barcode = (UUIDtoBarcode(i,id_type = "file_id")[2])
	        #print (typeof(tcga_barcode))
		#mylist <-c(mylist, tcga_barcode)
        }
	#print (head(mylist))
	#print (dim(mylist))
	#print (length(mylist))
	mylist <- mylist[, !duplicated(colnames(mylist))]
	file1=paste0("/gpfs/data/abl/home/mishrp03/LUAD/May_LUAD/", args[2])
	print (file1)
	write.table(mylist, file=file1, row.names=FALSE, quote=FALSE)
	#print (mylist)
}





#query <- GDCquery(project = "TCGA-LUAD",
#                  data.category = "Transcriptome Profiling",
#                  data.type = "Gene Expression Quantification",
#                  workflow.type = "HTSeq - Counts")


#GDCdownload(query, method = "api", files.per.chunk = 10)
#data <- GDCprepare(query)
#setwd("GDCdata/TCGA-LUAD/harmonized/Transcriptome_Profiling/Gene_Expression_Quantification/")
#file <- list.files("GDCdata/TCGA-LUAD/harmonized/Transcriptome_Profiling/Gene_Expression_Quantification/", recursive = TRUE, full.name = TRUE)



#d=read.table("d", sep="\t", header=FALSE)

#for (i in d){

#	print 
#}








#This path should be standard for any TCGA stuff
#:path=("test")
args = commandArgs(trailingOnly=TRUE)
x=read.table("UUID_TCGA_IDS_CONVERSION", sep="\t", header=TRUE)
colnames(x) =c( "UUID", "TCGA_id")
#path=("GDCdata/TCGA-LUAD/harmonized/Transcriptome_Profiling/Gene_Expression_Quantification/")
#find_TCGAids(path)
#kras=read.table("KRAS_G12_ONLY_UNDUPLICATED", sep="\t", header=FALSE)
kras=read.table(args[1], sep="\t", header=FALSE)
colnames(kras)=c("TCGA_id")
joins = inner_join(x,kras, by="TCGA_id")
#Find_kras mutations
find_kras = joins[[1]]
find_TCGAids(joins)
