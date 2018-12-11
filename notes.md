# Notes on setting up shiny on cloud.gov via dockerfile

1. get access to cloud.gov and login using 2nd certificate
2. install cloud foundry (if not already done) and log into cloud.gov with cloud foundry
  - https://cloud.gov/docs/getting-started/setup/
3. Build your app
  - shiny examples
    - Some in https://github.com/jhollist/cloud_gov_shiny  might not all be working...
4. Apps with just R package dependencies are pretty straightforward
5. Apps with external dependencies (i.e. geospatial) are less so
  - cf push rgdal -b https://github.com/cloudfoundry/apt-buildpack -b https://github.com/cloudfoundry/r-buildpack.git -s cflinuxfs3
  - Not currently working.  Installs dependencies but install.packages("rgdal") can't find the full gdal install.
6. Try docker...
7. Other resources:
  - https://pivotalsoftware.github.io/gp-r/#shiny_cf

