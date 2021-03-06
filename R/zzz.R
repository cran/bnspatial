.onAttach <- function(libname, pkgname) {
    if (interactive()) {
        msg <- paste(' - For help type ?bnspatial or go to: cran.r-project.org/package=bnspatial \n',
                     'License: GPL v3. Centre for Ecology and Hydrology.')
        if (length(find.package('RBGL', quiet=TRUE)) == 0){
            packageStartupMessage('NOTE: to use "bnspatial" you need first to install "RGBL" package from Bioconductor.\n',
                                  'To install on R version 3.5: \n',
                                  'install.packages("BiocManager"); BiocManager::install("RBGL", version = "3.8")  \n',
                                  'To install on R version 3.6: \n',
                                  'install.packages("BiocManager"); BiocManager::install("RBGL")  \n',
                                  '\nbnspatial ', as.character(utils::packageVersion("bnspatial")),
                                  msg, domain=NA, appendLF=TRUE)
        } else {
            packageStartupMessage('bnspatial ', as.character(utils::packageVersion("bnspatial")),
                                  msg, domain=NA, appendLF=TRUE)
        }

    }
}