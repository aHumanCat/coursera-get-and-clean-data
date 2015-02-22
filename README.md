
## Getting And Cleaning Data  - Section: getdata-011


### Introduction

This repo contains the data processing script and Codebook for the course project.


#### Data processing script:
`run_analysis.R` is a self-contained script that will download the  
required data Archive, process the needed files  
and write the final output dataset to the `./HARData` directory  
off your working directory in R.

When the script is initially run **NO** user input is required.  
Status messages will be displayed as the script is running.  
On additional runs of the script the user will be asked if  
they wish to use the copy of the data archive that was downloaded  
initially or to download a new copy.


`run_analysis.R` basic flow:

1. Create `./HARData` directory ,if needed, off of working directory.
2. Download UCI HAR archive file, if needed, to  `./HARData`
3. Read and process required data files from the UCI HAR archive file.
4. Write the output file `MeanAndStd.txt` to the `./HARData` directory.


`run_analysis.R` has been written and tested in RStudio on a Windows platform.  
Running the script at the command line R or on other platforms, i.e. Linux & MAC,  
may require some platform specifc code tweaks. [ file download parameters etc.]

Although `MeanAndStd.txt` can be viewed using editors such as Notepad++ or gvim  
it is designed to imported and viewed in R. (i.e. read.table()).

#### Codebook:

`codebook.md` contains details on design decisions, data filtering  
,sumerization and variable descriptions.


February 2015
