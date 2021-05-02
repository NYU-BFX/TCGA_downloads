#This script calculates the kras mutant ratio
#as compared to kras wild-type. 568 is the total number of samples 
#in TCGA-LUAD
library(gdata)
#File looks like
#B*44    HOMOZYGOUS      KRAS_MUTANT     1
#B*51    HOMOZYGOUS      KRAS_MUTANT     2
#B*07    HETEROZYGOUS    KRAS_MUTANT     19


x=read.table("KRAS_MUTANT_STATUS_HLAB", sep="\t", header=FALSE)
colnames(x) =c("HLA", "allele","kras", "num")

#Sum the kras type, homozygous and het
y=x%>% group_by(HLA, kras) %>% summarise(sum = sum(num))
#Find the percentage
y=y %>% mutate (percentage=sum/568*100)
#y %>% group_by(HLA) %>%  mutate (VV = first(is.numeric(percentage)) *100)

y=y %>% group_by(HLA) %>% mutate (ratio=first(percentage)/last(percentage) *100)
#y%>% filter(kras== "KRAS_WILD") %>% 
#h=y[which(y$kras == "KRAS_WILD",arr.ind=TRUE), 4 ] <- 0

#NEW df has only the KRAS mutants
NEW= y[y$kras == "KRAS_MUTANT", ] 

pdf("KRAS_mutant_wildtype.pdf")
ggplot(NEW , aes(x=reorder(HLA, ratio), y =ratio)) + geom_bar(stat="identity", width=0.5, fill="skyblue") +
  theme_bw()+
  theme(axis.text.x =element_text( angle=90), legend.position = "None", ) +
  geom_text(aes(label= paste0(trunc(ratio),"%")), vjust=-0.25, size=2, fontface="bold")+
  xlab("HLA") + ylab("Ratio % of KRAS mutant to  wildtype")
dev.off()
