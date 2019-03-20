1. with apt-buildpack got simple dependencies working
  - V8 with libv8-dev 
  - units with libudunits2-dev
2. `dplyr` is throwing other errors
  - compiling is running out of memory (even with 1GB memory)
  - takes time and hits 15 minute time out
  - vendoring might help with timeout
  - tried marutter's binaries, no dice, needs R first!
      - For posterity:
```
keys:
- https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC9A7585B49D51698710F3A115E25F516B04C661B 
repos:
- deb http://ppa.launchpad.net/marutter/c2d4u3.5/ubuntu bionic main 
- deb-src http://ppa.launchpad.net/marutter/c2d4u3.5/ubuntu bionic main
```      
3. Vendoring may be the solution if I can vendor the linux binaries.
  - miniCRAN 
    - should help creating the vendor_r folder.
    - https://kbroman.org/blog/2017/05/23/minicran/ 
    - https://blog.revolutionanalytics.com/2014/10/introducing-minicran.html
    - https://cran.r-project.org/web/packages/miniCRAN/index.html
    
  - set_up_vendor_r.R gets the vendored packages set up and it runs just fine but only works with source packages.  Won't help for packages that cant find their dependencies (e.g. rgdal) or are otherwise complicated (e.g. rgl).  
  - Need additional PATHs to search and more memory for compiling
  - Something that can happen by our org admins (memory), 
  - PATH stuff, I think, needs to be dealt with on the buildpack level.  Might be time to work up an issue for cloudfoundry/r-buildpack