resultsMARD <- matrix(0, 15, 24)
resultsSpear <- matrix(0, 15, 24)
for(sample in 1:12) {
  load(sprintf("./sim_counts_matrix_%s.rda", sample))
  
  quant_EM_01 <- read.delim(sprintf("./out_%s_01_quant_EM/quant.sf", sample), row.names=1)
  
  quant_both_01_neg5 <- read.delim(sprintf("./out_%s_01_quant_both_10^-5/quant.sf", sample), row.names=1)
  quant_both_01_neg4 <- read.delim(sprintf("./out_%s_01_quant_both_10^-4/quant.sf", sample), row.names=1)
  quant_both_01_neg3 <- read.delim(sprintf("./out_%s_01_quant_both_10^-3/quant.sf", sample), row.names=1)
  quant_both_01_neg2 <- read.delim(sprintf("./out_%s_01_quant_both_10^-2/quant.sf", sample), row.names=1)
  quant_both_01_neg1 <- read.delim(sprintf("./out_%s_01_quant_both_10^-1/quant.sf", sample), row.names=1)
  quant_both_01_pos0 <- read.delim(sprintf("./out_%s_01_quant_both_10^0/quant.sf", sample), row.names=1)
  quant_both_01_pos1 <- read.delim(sprintf("./out_%s_01_quant_both_10^1/quant.sf", sample), row.names=1)
  
  quant_VBEM_01_neg5 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^-5/quant.sf", sample), row.names=1)
  quant_VBEM_01_neg4 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^-4/quant.sf", sample), row.names=1)
  quant_VBEM_01_neg3 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^-3/quant.sf", sample), row.names=1)
  quant_VBEM_01_neg2 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^-2/quant.sf", sample), row.names=1)
  quant_VBEM_01_neg1 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^-1/quant.sf", sample), row.names=1)
  quant_VBEM_01_pos0 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^0/quant.sf", sample), row.names=1)
  quant_VBEM_01_pos1 <- read.delim(sprintf("./out_%s_01_quant_VBEM_10^1/quant.sf", sample), row.names=1)
  
  rownames(quant_EM_01) <- sub("\\|.*", "", rownames(quant_EM_01))
  
  rownames(quant_both_01_neg5) <- sub("\\|.*", "", rownames(quant_both_01_neg5))
  rownames(quant_both_01_neg4) <- sub("\\|.*", "", rownames(quant_both_01_neg4))
  rownames(quant_both_01_neg3) <- sub("\\|.*", "", rownames(quant_both_01_neg3))
  rownames(quant_both_01_neg2) <- sub("\\|.*", "", rownames(quant_both_01_neg2))
  rownames(quant_both_01_neg1) <- sub("\\|.*", "", rownames(quant_both_01_neg1))
  rownames(quant_both_01_pos0) <- sub("\\|.*", "", rownames(quant_both_01_pos0))
  rownames(quant_both_01_pos1) <- sub("\\|.*", "", rownames(quant_both_01_pos1))
  
  rownames(quant_VBEM_01_neg5) <- sub("\\|.*", "", rownames(quant_VBEM_01_neg5))
  rownames(quant_VBEM_01_neg4) <- sub("\\|.*", "", rownames(quant_VBEM_01_neg4))
  rownames(quant_VBEM_01_neg3) <- sub("\\|.*", "", rownames(quant_VBEM_01_neg3))
  rownames(quant_VBEM_01_neg2) <- sub("\\|.*", "", rownames(quant_VBEM_01_neg2))
  rownames(quant_VBEM_01_neg1) <- sub("\\|.*", "", rownames(quant_VBEM_01_neg1))
  rownames(quant_VBEM_01_pos0) <- sub("\\|.*", "", rownames(quant_VBEM_01_pos0))
  rownames(quant_VBEM_01_pos1) <- sub("\\|.*", "", rownames(quant_VBEM_01_pos1))
  
  rownames(quant_EM_01) <- sub("\\_.*", "", rownames(quant_EM_01))
  
  rownames(quant_both_01_neg5) <- sub("\\_.*", "", rownames(quant_both_01_neg5))
  rownames(quant_both_01_neg4) <- sub("\\_.*", "", rownames(quant_both_01_neg4))
  rownames(quant_both_01_neg3) <- sub("\\_.*", "", rownames(quant_both_01_neg3))
  rownames(quant_both_01_neg2) <- sub("\\_.*", "", rownames(quant_both_01_neg2))
  rownames(quant_both_01_neg1) <- sub("\\_.*", "", rownames(quant_both_01_neg1))
  rownames(quant_both_01_pos0) <- sub("\\_.*", "", rownames(quant_both_01_pos0))
  rownames(quant_both_01_pos1) <- sub("\\_.*", "", rownames(quant_both_01_pos1))
  
  rownames(quant_VBEM_01_neg5) <- sub("\\_.*", "", rownames(quant_VBEM_01_neg5))
  rownames(quant_VBEM_01_neg4) <- sub("\\_.*", "", rownames(quant_VBEM_01_neg4))
  rownames(quant_VBEM_01_neg3) <- sub("\\_.*", "", rownames(quant_VBEM_01_neg3))
  rownames(quant_VBEM_01_neg2) <- sub("\\_.*", "", rownames(quant_VBEM_01_neg2))
  rownames(quant_VBEM_01_neg1) <- sub("\\_.*", "", rownames(quant_VBEM_01_neg1))
  rownames(quant_VBEM_01_pos0) <- sub("\\_.*", "", rownames(quant_VBEM_01_pos0))
  rownames(quant_VBEM_01_pos1) <- sub("\\_.*", "", rownames(quant_VBEM_01_pos1))

  test01 <- data.frame(
    true=counts_matrix[,"sample_01"], 
    EM=quant_EM_01[rownames(counts_matrix),"NumReads"], 
    both_neg5=quant_both_01_neg5[rownames(counts_matrix),"NumReads"],
    both_neg4=quant_both_01_neg4[rownames(counts_matrix),"NumReads"],
    both_neg3=quant_both_01_neg3[rownames(counts_matrix),"NumReads"],
    both_neg2=quant_both_01_neg2[rownames(counts_matrix),"NumReads"],
    both_neg1=quant_both_01_neg1[rownames(counts_matrix),"NumReads"],
    both_pos0=quant_both_01_pos0[rownames(counts_matrix),"NumReads"],
    both_pos1=quant_both_01_pos1[rownames(counts_matrix),"NumReads"],
    VBEM_neg5=quant_VBEM_01_neg5[rownames(counts_matrix),"NumReads"], 
    VBEM_neg4=quant_VBEM_01_neg4[rownames(counts_matrix),"NumReads"],
    VBEM_neg3=quant_VBEM_01_neg3[rownames(counts_matrix),"NumReads"],
    VBEM_neg2=quant_VBEM_01_neg2[rownames(counts_matrix),"NumReads"],
    VBEM_neg1=quant_VBEM_01_neg1[rownames(counts_matrix),"NumReads"],
    VBEM_pos0=quant_VBEM_01_pos0[rownames(counts_matrix),"NumReads"],
    VBEM_pos1=quant_VBEM_01_pos1[rownames(counts_matrix),"NumReads"])
  test <- data.frame(
    true=0,
    EM=quant_EM_01[rownames(quant_EM_01)[!(rownames(quant_EM_01) %in% rownames(counts_matrix))],"NumReads"], 
    both_neg5=quant_both_01_neg5[rownames(quant_both_01_neg5)[!(rownames(quant_both_01_neg5) %in% rownames(counts_matrix))],"NumReads"],
    both_neg4=quant_both_01_neg4[rownames(quant_both_01_neg4)[!(rownames(quant_both_01_neg4) %in% rownames(counts_matrix))],"NumReads"],
    both_neg3=quant_both_01_neg3[rownames(quant_both_01_neg3)[!(rownames(quant_both_01_neg3) %in% rownames(counts_matrix))],"NumReads"],
    both_neg2=quant_both_01_neg2[rownames(quant_both_01_neg2)[!(rownames(quant_both_01_neg2) %in% rownames(counts_matrix))],"NumReads"],
    both_neg1=quant_both_01_neg1[rownames(quant_both_01_neg1)[!(rownames(quant_both_01_neg1) %in% rownames(counts_matrix))],"NumReads"],
    both_pos0=quant_both_01_pos0[rownames(quant_both_01_pos0)[!(rownames(quant_both_01_pos0) %in% rownames(counts_matrix))],"NumReads"],
    both_pos1=quant_both_01_pos1[rownames(quant_both_01_pos1)[!(rownames(quant_both_01_pos1) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg5=quant_VBEM_01_neg5[rownames(quant_VBEM_01_neg5)[!(rownames(quant_VBEM_01_neg5) %in% rownames(counts_matrix))],"NumReads"], 
    VBEM_neg4=quant_VBEM_01_neg4[rownames(quant_VBEM_01_neg4)[!(rownames(quant_VBEM_01_neg4) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg3=quant_VBEM_01_neg3[rownames(quant_VBEM_01_neg3)[!(rownames(quant_VBEM_01_neg3) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg2=quant_VBEM_01_neg2[rownames(quant_VBEM_01_neg2)[!(rownames(quant_VBEM_01_neg2) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg1=quant_VBEM_01_neg1[rownames(quant_VBEM_01_neg1)[!(rownames(quant_VBEM_01_neg1) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_pos0=quant_VBEM_01_pos0[rownames(quant_VBEM_01_pos0)[!(rownames(quant_VBEM_01_pos0) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_pos1=quant_VBEM_01_pos1[rownames(quant_VBEM_01_pos1)[!(rownames(quant_VBEM_01_pos1) %in% rownames(counts_matrix))],"NumReads"])
  
  rownames(test) <- rownames(quant_EM_01)[!(rownames(quant_EM_01) %in% rownames(counts_matrix))]
  test01 <- rbind(test01, test)
  test01[is.na(test01)] <- 0
  
  quant_EM_02 <- read.delim(sprintf("./out_%s_02_quant_EM/quant.sf", sample), row.names=1)
  
  quant_both_02_neg5 <- read.delim(sprintf("./out_%s_02_quant_both_10^-5/quant.sf", sample), row.names=1)
  quant_both_02_neg4 <- read.delim(sprintf("./out_%s_02_quant_both_10^-4/quant.sf", sample), row.names=1)
  quant_both_02_neg3 <- read.delim(sprintf("./out_%s_02_quant_both_10^-3/quant.sf", sample), row.names=1)
  quant_both_02_neg2 <- read.delim(sprintf("./out_%s_02_quant_both_10^-2/quant.sf", sample), row.names=1)
  quant_both_02_neg1 <- read.delim(sprintf("./out_%s_02_quant_both_10^-1/quant.sf", sample), row.names=1)
  quant_both_02_pos0 <- read.delim(sprintf("./out_%s_02_quant_both_10^0/quant.sf", sample), row.names=1)
  quant_both_02_pos1 <- read.delim(sprintf("./out_%s_02_quant_both_10^1/quant.sf", sample), row.names=1)
  
  quant_VBEM_02_neg5 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^-5/quant.sf", sample), row.names=1)
  quant_VBEM_02_neg4 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^-4/quant.sf", sample), row.names=1)
  quant_VBEM_02_neg3 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^-3/quant.sf", sample), row.names=1)
  quant_VBEM_02_neg2 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^-2/quant.sf", sample), row.names=1)
  quant_VBEM_02_neg1 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^-1/quant.sf", sample), row.names=1)
  quant_VBEM_02_pos0 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^0/quant.sf", sample), row.names=1)
  quant_VBEM_02_pos1 <- read.delim(sprintf("./out_%s_02_quant_VBEM_10^1/quant.sf", sample), row.names=1)
  
  rownames(quant_EM_02) <- sub("\\|.*", "", rownames(quant_EM_02))
  
  rownames(quant_both_02_neg5) <- sub("\\|.*", "", rownames(quant_both_02_neg5))
  rownames(quant_both_02_neg4) <- sub("\\|.*", "", rownames(quant_both_02_neg4))
  rownames(quant_both_02_neg3) <- sub("\\|.*", "", rownames(quant_both_02_neg3))
  rownames(quant_both_02_neg2) <- sub("\\|.*", "", rownames(quant_both_02_neg2))
  rownames(quant_both_02_neg1) <- sub("\\|.*", "", rownames(quant_both_02_neg1))
  rownames(quant_both_02_pos0) <- sub("\\|.*", "", rownames(quant_both_02_pos0))
  rownames(quant_both_02_pos1) <- sub("\\|.*", "", rownames(quant_both_02_pos1))
  
  rownames(quant_VBEM_02_neg5) <- sub("\\|.*", "", rownames(quant_VBEM_02_neg5))
  rownames(quant_VBEM_02_neg4) <- sub("\\|.*", "", rownames(quant_VBEM_02_neg4))
  rownames(quant_VBEM_02_neg3) <- sub("\\|.*", "", rownames(quant_VBEM_02_neg3))
  rownames(quant_VBEM_02_neg2) <- sub("\\|.*", "", rownames(quant_VBEM_02_neg2))
  rownames(quant_VBEM_02_neg1) <- sub("\\|.*", "", rownames(quant_VBEM_02_neg1))
  rownames(quant_VBEM_02_pos0) <- sub("\\|.*", "", rownames(quant_VBEM_02_pos0))
  rownames(quant_VBEM_02_pos1) <- sub("\\|.*", "", rownames(quant_VBEM_02_pos1))
  
  rownames(quant_EM_02) <- sub("\\_.*", "", rownames(quant_EM_02))
  
  rownames(quant_both_02_neg5) <- sub("\\_.*", "", rownames(quant_both_02_neg5))
  rownames(quant_both_02_neg4) <- sub("\\_.*", "", rownames(quant_both_02_neg4))
  rownames(quant_both_02_neg3) <- sub("\\_.*", "", rownames(quant_both_02_neg3))
  rownames(quant_both_02_neg2) <- sub("\\_.*", "", rownames(quant_both_02_neg2))
  rownames(quant_both_02_neg1) <- sub("\\_.*", "", rownames(quant_both_02_neg1))
  rownames(quant_both_02_pos0) <- sub("\\_.*", "", rownames(quant_both_02_pos0))
  rownames(quant_both_02_pos1) <- sub("\\_.*", "", rownames(quant_both_02_pos1))
  
  rownames(quant_VBEM_02_neg5) <- sub("\\_.*", "", rownames(quant_VBEM_02_neg5))
  rownames(quant_VBEM_02_neg4) <- sub("\\_.*", "", rownames(quant_VBEM_02_neg4))
  rownames(quant_VBEM_02_neg3) <- sub("\\_.*", "", rownames(quant_VBEM_02_neg3))
  rownames(quant_VBEM_02_neg2) <- sub("\\_.*", "", rownames(quant_VBEM_02_neg2))
  rownames(quant_VBEM_02_neg1) <- sub("\\_.*", "", rownames(quant_VBEM_02_neg1))
  rownames(quant_VBEM_02_pos0) <- sub("\\_.*", "", rownames(quant_VBEM_02_pos0))
  rownames(quant_VBEM_02_pos1) <- sub("\\_.*", "", rownames(quant_VBEM_02_pos1))
  
  test02 <- data.frame(
    true=counts_matrix[,"sample_02"], 
    EM=quant_EM_02[rownames(counts_matrix),"NumReads"], 
    both_neg5=quant_both_02_neg5[rownames(counts_matrix),"NumReads"],
    both_neg4=quant_both_02_neg4[rownames(counts_matrix),"NumReads"],
    both_neg3=quant_both_02_neg3[rownames(counts_matrix),"NumReads"],
    both_neg2=quant_both_02_neg2[rownames(counts_matrix),"NumReads"],
    both_neg1=quant_both_02_neg1[rownames(counts_matrix),"NumReads"],
    both_pos0=quant_both_02_pos0[rownames(counts_matrix),"NumReads"],
    both_pos1=quant_both_02_pos1[rownames(counts_matrix),"NumReads"],
    VBEM_neg5=quant_VBEM_02_neg5[rownames(counts_matrix),"NumReads"], 
    VBEM_neg4=quant_VBEM_02_neg4[rownames(counts_matrix),"NumReads"],
    VBEM_neg3=quant_VBEM_02_neg3[rownames(counts_matrix),"NumReads"],
    VBEM_neg2=quant_VBEM_02_neg2[rownames(counts_matrix),"NumReads"],
    VBEM_neg1=quant_VBEM_02_neg1[rownames(counts_matrix),"NumReads"],
    VBEM_pos0=quant_VBEM_02_pos0[rownames(counts_matrix),"NumReads"],
    VBEM_pos1=quant_VBEM_02_pos1[rownames(counts_matrix),"NumReads"])
  test <- data.frame(
    true=0,
    EM=quant_EM_02[rownames(quant_EM_02)[!(rownames(quant_EM_02) %in% rownames(counts_matrix))],"NumReads"], 
    both_neg5=quant_both_02_neg5[rownames(quant_both_02_neg5)[!(rownames(quant_both_02_neg5) %in% rownames(counts_matrix))],"NumReads"],
    both_neg4=quant_both_02_neg4[rownames(quant_both_02_neg4)[!(rownames(quant_both_02_neg4) %in% rownames(counts_matrix))],"NumReads"],
    both_neg3=quant_both_02_neg3[rownames(quant_both_02_neg3)[!(rownames(quant_both_02_neg3) %in% rownames(counts_matrix))],"NumReads"],
    both_neg2=quant_both_02_neg2[rownames(quant_both_02_neg2)[!(rownames(quant_both_02_neg2) %in% rownames(counts_matrix))],"NumReads"],
    both_neg1=quant_both_02_neg1[rownames(quant_both_02_neg1)[!(rownames(quant_both_02_neg1) %in% rownames(counts_matrix))],"NumReads"],
    both_pos0=quant_both_02_pos0[rownames(quant_both_02_pos0)[!(rownames(quant_both_02_pos0) %in% rownames(counts_matrix))],"NumReads"],
    both_pos1=quant_both_02_pos1[rownames(quant_both_02_pos1)[!(rownames(quant_both_02_pos1) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg5=quant_VBEM_02_neg5[rownames(quant_VBEM_02_neg5)[!(rownames(quant_VBEM_02_neg5) %in% rownames(counts_matrix))],"NumReads"], 
    VBEM_neg4=quant_VBEM_02_neg4[rownames(quant_VBEM_02_neg4)[!(rownames(quant_VBEM_02_neg4) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg3=quant_VBEM_02_neg3[rownames(quant_VBEM_02_neg3)[!(rownames(quant_VBEM_02_neg3) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg2=quant_VBEM_02_neg2[rownames(quant_VBEM_02_neg2)[!(rownames(quant_VBEM_02_neg2) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_neg1=quant_VBEM_02_neg1[rownames(quant_VBEM_02_neg1)[!(rownames(quant_VBEM_02_neg1) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_pos0=quant_VBEM_02_pos0[rownames(quant_VBEM_02_pos0)[!(rownames(quant_VBEM_02_pos0) %in% rownames(counts_matrix))],"NumReads"],
    VBEM_pos1=quant_VBEM_02_pos1[rownames(quant_VBEM_02_pos1)[!(rownames(quant_VBEM_02_pos1) %in% rownames(counts_matrix))],"NumReads"])
  
  rownames(test) <- rownames(quant_EM_02)[!(rownames(quant_EM_02) %in% rownames(counts_matrix))]
  test02 <- rbind(test02, test)
  test02[is.na(test02)] <- 0
                  
  diff_EM_01 <- abs(test01[,"true"]-test01[,"EM"])/(test01[,"true"]+test01[,"EM"])
  diff_EM_02 <- abs(test02[,"true"]-test02[,"EM"])/(test02[,"true"]+test02[,"EM"])
  
  resultsMARD[1,2*sample-1] = mean(diff_EM_01, na.rm = TRUE)
  resultsMARD[1,2*sample] = mean(diff_EM_02, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"EM"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"EM"], alternative="two.sided", method="spearman")
  
  resultsSpear[1,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[1,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_neg5 <- abs(test01[,"true"]-test01[,"both_neg5"])/(test01[,"true"]+test01[,"both_neg5"])
  diff_both_02_neg5 <- abs(test02[,"true"]-test02[,"both_neg5"])/(test02[,"true"]+test02[,"both_neg5"])
  
  resultsMARD[2,2*sample-1] = mean(diff_both_01_neg5, na.rm = TRUE)
  resultsMARD[2,2*sample] = mean(diff_both_02_neg5, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_neg5"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_neg5"], alternative="two.sided", method="spearman")
  
  resultsSpear[2,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[2,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_neg4 <- abs(test01[,"true"]-test01[,"both_neg4"])/(test01[,"true"]+test01[,"both_neg4"])
  diff_both_02_neg4 <- abs(test02[,"true"]-test02[,"both_neg4"])/(test02[,"true"]+test02[,"both_neg4"])
  
  resultsMARD[3,2*sample-1] = mean(diff_both_01_neg4, na.rm = TRUE)
  resultsMARD[3,2*sample] = mean(diff_both_02_neg4, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_neg4"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_neg4"], alternative="two.sided", method="spearman")
  
  resultsSpear[3,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[3,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_neg3 <- abs(test01[,"true"]-test01[,"both_neg3"])/(test01[,"true"]+test01[,"both_neg3"])
  diff_both_02_neg3 <- abs(test02[,"true"]-test02[,"both_neg3"])/(test02[,"true"]+test02[,"both_neg3"])
  
  resultsMARD[4,2*sample-1] = mean(diff_both_01_neg3, na.rm = TRUE)
  resultsMARD[4,2*sample] = mean(diff_both_02_neg3, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_neg3"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_neg3"], alternative="two.sided", method="spearman")
  
  resultsSpear[4,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[4,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_neg2 <- abs(test01[,"true"]-test01[,"both_neg2"])/(test01[,"true"]+test01[,"both_neg2"])
  diff_both_02_neg2 <- abs(test02[,"true"]-test02[,"both_neg2"])/(test02[,"true"]+test02[,"both_neg2"])
  
  resultsMARD[5,2*sample-1] = mean(diff_both_01_neg2, na.rm = TRUE)
  resultsMARD[5,2*sample] = mean(diff_both_02_neg2, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_neg2"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_neg2"], alternative="two.sided", method="spearman")
  
  resultsSpear[5,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[5,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_neg1 <- abs(test01[,"true"]-test01[,"both_neg1"])/(test01[,"true"]+test01[,"both_neg1"])
  diff_both_02_neg1 <- abs(test02[,"true"]-test02[,"both_neg1"])/(test02[,"true"]+test02[,"both_neg1"])
  
  resultsMARD[6,2*sample-1] = mean(diff_both_01_neg1, na.rm = TRUE)
  resultsMARD[6,2*sample] = mean(diff_both_02_neg1, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_neg1"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_neg1"], alternative="two.sided", method="spearman")
  
  resultsSpear[6,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[6,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_pos0 <- abs(test01[,"true"]-test01[,"both_pos0"])/(test01[,"true"]+test01[,"both_pos0"])
  diff_both_02_pos0 <- abs(test02[,"true"]-test02[,"both_pos0"])/(test02[,"true"]+test02[,"both_pos0"])
  
  resultsMARD[7,2*sample-1] = mean(diff_both_01_pos0, na.rm = TRUE)
  resultsMARD[7,2*sample] = mean(diff_both_02_pos0, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_pos0"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_pos0"], alternative="two.sided", method="spearman")
  
  resultsSpear[7,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[7,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_both_01_pos1 <- abs(test01[,"true"]-test01[,"both_pos1"])/(test01[,"true"]+test01[,"both_pos1"])
  diff_both_02_pos1 <- abs(test02[,"true"]-test02[,"both_pos1"])/(test02[,"true"]+test02[,"both_pos1"])
  
  resultsMARD[8,2*sample-1] = mean(diff_both_01_pos1, na.rm = TRUE)
  resultsMARD[8,2*sample] = mean(diff_both_02_pos1, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"both_pos1"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"both_pos1"], alternative="two.sided", method="spearman")
  
  resultsSpear[8,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[8,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_neg5 <- abs(test01[,"true"]-test01[,"VBEM_neg5"])/(test01[,"true"]+test01[,"VBEM_neg5"])
  diff_VBEM_02_neg5 <- abs(test02[,"true"]-test02[,"VBEM_neg5"])/(test02[,"true"]+test02[,"VBEM_neg5"])
  
  resultsMARD[9,2*sample-1] = mean(diff_VBEM_01_neg5, na.rm = TRUE)
  resultsMARD[9,2*sample] = mean(diff_VBEM_02_neg5, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_neg5"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_neg5"], alternative="two.sided", method="spearman")
  
  resultsSpear[9,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[9,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_neg4 <- abs(test01[,"true"]-test01[,"VBEM_neg4"])/(test01[,"true"]+test01[,"VBEM_neg4"])
  diff_VBEM_02_neg4 <- abs(test02[,"true"]-test02[,"VBEM_neg4"])/(test02[,"true"]+test02[,"VBEM_neg4"])
  
  resultsMARD[10,2*sample-1] = mean(diff_VBEM_01_neg4, na.rm = TRUE)
  resultsMARD[10,2*sample] = mean(diff_VBEM_02_neg4, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_neg4"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_neg4"], alternative="two.sided", method="spearman")
  
  resultsSpear[10,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[10,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_neg3 <- abs(test01[,"true"]-test01[,"VBEM_neg3"])/(test01[,"true"]+test01[,"VBEM_neg3"])
  diff_VBEM_02_neg3 <- abs(test02[,"true"]-test02[,"VBEM_neg3"])/(test02[,"true"]+test02[,"VBEM_neg3"])
  
  resultsMARD[11,2*sample-1] = mean(diff_VBEM_01_neg3, na.rm = TRUE)
  resultsMARD[11,2*sample] = mean(diff_VBEM_02_neg3, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_neg3"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_neg3"], alternative="two.sided", method="spearman")
  
  resultsSpear[11,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[11,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_neg2 <- abs(test01[,"true"]-test01[,"VBEM_neg2"])/(test01[,"true"]+test01[,"VBEM_neg2"])
  diff_VBEM_02_neg2 <- abs(test02[,"true"]-test02[,"VBEM_neg2"])/(test02[,"true"]+test02[,"VBEM_neg2"])
  
  resultsMARD[12,2*sample-1] = mean(diff_VBEM_01_neg2, na.rm = TRUE)
  resultsMARD[12,2*sample] = mean(diff_VBEM_02_neg2, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_neg2"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_neg2"], alternative="two.sided", method="spearman")
  
  resultsSpear[12,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[12,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_neg1 <- abs(test01[,"true"]-test01[,"VBEM_neg1"])/(test01[,"true"]+test01[,"VBEM_neg1"])
  diff_VBEM_02_neg1 <- abs(test02[,"true"]-test02[,"VBEM_neg1"])/(test02[,"true"]+test02[,"VBEM_neg1"])
  
  resultsMARD[13,2*sample-1] = mean(diff_VBEM_01_neg1, na.rm = TRUE)
  resultsMARD[13,2*sample] = mean(diff_VBEM_02_neg1, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_neg1"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_neg1"], alternative="two.sided", method="spearman")
  
  resultsSpear[13,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[13,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_pos0 <- abs(test01[,"true"]-test01[,"VBEM_pos0"])/(test01[,"true"]+test01[,"VBEM_pos0"])
  diff_VBEM_02_pos0 <- abs(test02[,"true"]-test02[,"VBEM_pos0"])/(test02[,"true"]+test02[,"VBEM_pos0"])
  
  resultsMARD[14,2*sample-1] = mean(diff_VBEM_01_pos0, na.rm = TRUE)
  resultsMARD[14,2*sample] = mean(diff_VBEM_02_pos0, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_pos0"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_pos0"], alternative="two.sided", method="spearman")
  
  resultsSpear[14,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[14,2*sample] = spear_02[["estimate"]][["rho"]]
  
  diff_VBEM_01_pos1 <- abs(test01[,"true"]-test01[,"VBEM_pos1"])/(test01[,"true"]+test01[,"VBEM_pos1"])
  diff_VBEM_02_pos1 <- abs(test02[,"true"]-test02[,"VBEM_pos1"])/(test02[,"true"]+test02[,"VBEM_pos1"])
  
  resultsMARD[15,2*sample-1] = mean(diff_VBEM_01_pos1, na.rm = TRUE)
  resultsMARD[15,2*sample] = mean(diff_VBEM_02_pos1, na.rm = TRUE)
  
  spear_01 = cor.test(test01[,"true"], test01[,"VBEM_pos1"], alternative="two.sided", method="spearman")
  spear_02 = cor.test(test02[,"true"], test02[,"VBEM_pos1"], alternative="two.sided", method="spearman")
  
  resultsSpear[15,2*sample-1] = spear_01[["estimate"]][["rho"]]
  resultsSpear[15,2*sample] = spear_02[["estimate"]][["rho"]]
}
resultsMARD
resultsSpear
