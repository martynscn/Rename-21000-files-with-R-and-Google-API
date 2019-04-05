library("RoogleVision")


library("googleAuthR")
require(RCurl)
options("googleAuthR.client_id" = "734454100438-s8d0u05kokn55mdohg02saiv0o7o55lu.apps.googleusercontent.com")
options("googleAuthR.client_secret" = "uzXMwPK1hZqI1CnzPLVttMUM")
options("googleAuthR.scopes.selected" = c("https://www.googleapis.com/auth/cloud-platform"))
setwd("C:/Users/totus tuus/Documents/R_projects/Rename_21000_Files_Using_Google_API/testImages/LEVEL1B/")
googleAuthR::gar_auth()



rootfiles <- list.files(recursive=TRUE)
count <- 0
pattern <- "\\.[A-Za-z0-9]+$"
baseFileName <- "MartynsPngfile"
textLength <- 30
for (r in rootfiles) {
  # r <- "testImages/LEVEL1B/MartynsPngfile8.png"
	count <- count + 1	
	extension <- regmatches(r, regexpr(pattern, r), invert = FALSE)
	if(extension == ".png" || extension == ".jpg") {
		folderDir <- regmatches(r, regexpr("([0-9a-zA-Z_]+/){0,10}", r), invert = FALSE)
		VisionAPIResp <- getGoogleVisionResponse(imagePath = r, feature = "TEXT_DETECTION")
		VisionAPINameLong <-  gsub(":|\n|\\?|/|\\.|\\(|\\)","_",paste(VisionAPIResp$description,collapse = ""))
		VisionAPIName <- stringr::str_sub(VisionAPINameLong,1,textLength)
		#newFileName <- paste0(folderDir,baseFileName,count,extension)
		newFileName <- paste0(folderDir,VisionAPIName,extension)
		file.rename(r,newFileName)
		print(paste0("old name: ",r))
		print(paste0("new name: ",newFileName))
		print(paste0("VisionAPIName name: ",VisionAPIName))
	}
}


