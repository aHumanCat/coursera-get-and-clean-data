###############################################################################
# run_analysis.R                                                              #
#  Download ,if needed, the dataset archive from the UCI HAR Smartphone study.#
#  Process it as specified by the codebook codebook requirements              #
#  and write the output to a text file.                                       #
###############################################################################
#
# Setup:
#
library("plyr")
dataDir <- "./HARData"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataSetArchive <- sprintf( "%s/UCI_HAR_Dataset.zip", dataDir )
archiveBaseDir <- "UCI HAR Dataset"
outFile <- "MeanAndStd.txt"
validResponse <- FALSE
useLocalDataSet <- FALSE

# convience functions

#
# Extract and return requested data file from archive
getDataFile <- function( filePath ) {
   
   # using unz to extract only the needed files and pass directly to read.table.
   #  no need to clutter up the file system with extratced raw files
   unz( dataSetArchive, sprintf( "%s/%s", archiveBaseDir, filePath ))

}

#
# Build and return requested combined dataset
getDataSet <- function( subdir ) {
  
  measurements <- read.table( getDataFile( sprintf("%s/X_%s.txt", subdir, subdir )), colClasses = columnsToRead)
  activities   <- read.table( getDataFile( sprintf("%s/y_%s.txt", subdir, subdir )), col.names = c("Activities"))
  subjects     <- read.table( getDataFile( sprintf("%s/subject_%s.txt", subdir, subdir)), col.names = c("Subjects"))

  # Rename measurements columns to the 
  #  "descriptive variable names" 
  #   extracted from features.txt.
  names( measurements ) <- featuresTrim[,2]
  
  # Combine subjects, activities & measurements dataframes into 
  # a single dataframe.
  cbind(subjects,activities,measurements)

}
####
# Setup complete

# Processing start 

cat( "Running Program\n")

# if the data directory does not exist create it.
# if it does exist and the datafile archive has already been downloaded ask
#   the user if they wish to reuse it or download a fresh copy.
# No need to download a copy each time you run the process.
# The archive has not been updated since 2010

if( !file.exists( dataDir )){
  
  cat( sprintf( "Creating data directory %s\n", dataDir ))
  dir.create( dataDir )
  
}else{
  if( file.exists( dataSetArchive)){
    
    cat(sprintf("\n | Dataset Archive %s is existing.\n", dataSetArchive))
    
    while( validResponse == FALSE ){      
      
      answer <- readline("would you like to use the local copy?[ Y or N ] ")
      
      if( validResponse <- grepl("[Yy]", answer) ){
        
        useLocalDataSet <- TRUE
        cat( sprintf(" | Using local copy of %s\n", dataSetArchive))
        
      }
      else if( validResponse <- grepl("[Nn]", answer ) ){
    
        useLocalDataSet <- FALSE
        
      }
    }
  }
}

#
# Download dataset archive if needed/requested
#
if( !useLocalDataSet )
{
  cat( sprintf("Downloading data Archive\n"))
    
  download.file( fileUrl, destfile = dataSetArchive )  
  
}

# Load activity label data
activityLabels <- read.table( getDataFile( "activity_labels.txt" ))[,2]

#######
# Load and process feature data 
features <- read.table( getDataFile( "features.txt" ))

#Select only the features(columns) holding "-mean()" & "-std()" data
# per codebook specs
featuresTrim <- features[ grep( "-mean\\(\\)|-std\\(\\)", features[,2] ), ]

# vector of column indexes used by read.table() to filter
# out all but the desired -mean() and -std() columns when creating table.
# NULL will be ignored. NA will be extracted.
columnsToRead <- rep( "NULL", nrow( features )); 
columnsToRead[featuresTrim[,1]] <- NA

#######

# Build the train and test datasets
cat( "Building train dataset\n")
trainDataSet <- getDataSet( "train" )

cat( "Building test dataset\n")
testDataSet  <- getDataSet( "test" )

# Combine the train and test datasets
# then arrange/sort the output set by Subjects & Activites.
allInOneData <- join( testDataSet, trainDataSet, type="full", by="Subjects" )
allInOneData <- arrange( allInOneData, Subjects, Activities)

# Create the output dataset per codebook "with the average of each variable
#  for each activity and each subject".
# Wide format is used for the data representation
# Subjects, Activities, ..(66 distinct measurements)..
finalDataSet <- ddply( allInOneData, .( Subjects, Activities ), colMeans)

# Replace the integer Activities column entries with
# the descriptive labels from activity_labels.txt
finalDataSet$Activities <- as.factor( finalDataSet$Activities )
levels( finalDataSet$Activities ) <- activityLabels

# Write output file to dataDir
cat( sprintf( "Writing output file %s to %s\n", outFile, dataDir))
write.table( finalDataSet, sprintf( "%s/%s", dataDir, outFile), row.name=FALSE )

cat( "Program Complete.\n")

# End of Program

