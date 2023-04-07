# Deploying apps with BioConductor Dependencies

## vanilla

using a package manager bioconductor repository

https://colorado.posit.co/rsc/bioconductor-example/vanilla/

### setup

1. [Set CRAN and BioConductor as repositories for the session](https://p3m.dev/client/#/repos/4/overview)
1. Install `BiocManager`
1. Install Bioconductor dependencies
1. Install other dependencies
1. Generate a manifest

```r
options(
repos = c(
  CRAN = "https://p3m.dev/cran/__linux__/bionic/latest"
  ), 
BioC_mirror = "https://p3m.dev/bioconductor"
)
BiocManager::install("DelayedArray")
install.packages("shiny")
rsconnect::writeManifest()
```

The packages in the manifest should list the Package Manager Bioconductor repository as the source.

## biocran

configure package manager to serve bioconductor packages from a cran repository

https://colorado.posit.co/rsc/bioconductor-example/biocran/

### setup

1. Configure your instance of Package Manager to serve Bioconductor packages from a CRAN repository: https://docs.posit.co/rspm/admin/getting-started/configuration/#quickstart-bioconductor-r-repos  
an example repository illustrating this configuration can be viewed here:  
https://colorado.posit.co/rspm/client/#/repos/17/overview
1. [Set this hybrid repository as the repository for the session](https://colorado.posit.co/rspm/client/#/repos/17/overview)
1. Install dependencies 
1. Generate a manifest 

```r
options(repos = c(biocran = "https://colorado.posit.co/rspm/biocran-3.16/__linux__/bionic/latest"))
install.packages(c("shiny", "DelayedArray"))
rsconnect::writeManifest()
```

The packages in the manifest should list `biocran` as the source.