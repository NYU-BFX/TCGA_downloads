# TCGA_downloads

This is mostly applicable to controlled data access in GDC. Almost all kinds of data is accessible through GDC/TCGABiolinks/GenomicDataCommons etc patient specific HLA allele calls. Exome or RNA-seq data can be downloaded depending on your HLA-caller. arcasHLA is a preferred caller since it calls MHC Class 1 and Class 2 using RNA-Seq BAMs(https://github.com/RabadanLab/arcasHLA)



1. For controlled data from GDC portal, you will have to acquire a eRA commons account. This is mostly through an administrator at your institute and once you login using your eRA login(https://public.era.nih.gov/commonsplus/public/login.era?TARGET=https%3A%2F%2Fpublic.era.nih.gov%3A443%2Fcommonsplus%2Fhome.era), you will also need dbGAP access. This is mostly through a PI who has access to dbGaP and he/she can add you to the list of personnel who can access dbGap.
2. Once access is granted through dgGaP and eRA, proceed to GDC portal here:https://portal.gdc.cancer.gov/
3. Type (for example: TCGA-LUAD) in the search box.
4. For BAM downloads, select "Sequencing Reads" -> and next page -> "bam" in the left hand side panel. Select RNA-Seq or WGS or WXS according to your requirement.
5. Download a "Manifest" file from the top right hand button. Attached is an example of the manifest file
6. To map UUIDs to TCGA barcodes from this manifest file, use the script manifest_to_TCGA_ID.R
