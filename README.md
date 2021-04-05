# TCGA_downloads
---How to download TCGA data from GDC portal------

For controlled data from GDC portal, you will have to acquire a eRA commons account. This is mostly through an administrator at your institute and once you login using your eRA login(https://public.era.nih.gov/commonsplus/public/login.era?TARGET=https%3A%2F%2Fpublic.era.nih.gov%3A443%2Fcommonsplus%2Fhome.era), you will also need dbGAP access. This is mostly through a PI who has access to dbGaP and he/she can add you to the list of personnel who can access dbGap.
Once access is granted through dgGaP and eRA, proceed to GDC portal here:https://portal.gdc.cancer.gov/
Type (for example: TCGA-LUAD) in the search box.
For BAM downloads, select "Sequencing Reads" -> and next page -> "bam" in the left hand side panel. Select RNA-Seq or WGS or WXS according to your requirement.
Download a "Manifest" file from the top right hand button. Attached is an exmaple of the manifest file
To map UUIDs to TCGA barcodes from this manifest file, use the script manifest_to_TCGA_ID.R
