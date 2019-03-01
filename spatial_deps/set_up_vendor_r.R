library(miniCRAN)
rstudio_repo <- c(CRAN = "https://cran.rstudio.com")

# vector of packages required by app
pkgs <- c("rgdal")

# Package dependencies
pkgs_and_deps <- pkgDep(pkgs, repos = rstudio_repo, type = "source",
                        suggests = TRUE)


# create vendor_r folder
# path to app folder
if(dir.exists("simple_deps/vendor_r")){
  makeRepo(pkgs_and_deps, path = "simple_deps/vendor_r", 
           repos = rstudio_repo, type = c("source"))
} else {
  dir.create("simple_deps/vendor_r")
  makeRepo(pkgs_and_deps, path = "simple_deps/vendor_r", 
           repos = rstudio_repo, type = c("source"))
}
