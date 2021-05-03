library(dplyr)
x=read.table("NEW11", sep=" ", header=TRUE ,check.names=FALSE)  

#Drop the 2nd column which has gene names with a ".13" or ".1"
x=x[,-c(2)]
y=read.table("Genes_Ensembl_HtSeq_TCGA", sep="\t", header=TRUE)
df = inner_join(x,y, by="Genes") 

new_df <- df %>%select("external_gene_name", everything())
new_df =new_df[,-c(2)]
ex_df <- new_df %>% distinct(external_gene_name, .keep_all=TRUE)
#coMMANT THIS for wild type
#ex_df =ex_df[,-c(1)]
write.table(ex_df, "NEE", sep="\t",  row.names=FALSE,quote=FALSE)
