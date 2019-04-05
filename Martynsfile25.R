setwd("c:/Users/totus tuus/Documents/R_projects/Rename_21000_Files_Using_Google_API/")
rootfiles <- list.files(recursive=TRUE)
count <- 0
pattern <- "\\.[A-Za-z0-9]+$"
for (r in rootfiles) {
	count <- count + 1	
	extension <- regmatches(r, regexpr(pattern, r), invert = FALSE)
	folderDir <- regmatches(r, regexpr("([0-9a-zA-Z_]+/){0,10}", r), invert = FALSE)
	print(paste0("old name: ",r))
	
	
	file.rename(r,paste0(folderDir,"Martynsfile",count,extension))
	print(paste0("new name: ",paste0(folderDir,"Myfile",count,extension)))
}
