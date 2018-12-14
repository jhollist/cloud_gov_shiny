# Notes on setting up shiny on cloud.gov via dockerfile

1. install cloud foundry (if not already done) and log into cloud.gov with cloud foundry
  - https://cloud.gov/docs/getting-started/setup/
2. get access to cloud.gov and login.
  - if using ID, select 2nd certificate (at least that what it was on Jeff's ID)
  - You can login via the browswer to see the dashboard, but most of cloud foundry tools you need to access via the command line interface (CLI).  
  - Log-in via the CLI is accomplished with:
    - `cf login -a api.fr.cloud.gov  --sso`
  - You will be directed to go to <https://login.fr.cloud.gov/passcode> to get a temporary authorization code.  If you have already logged in it will take you straght there, otherwise you will need to jump through the EPA authentication hoops.
  - A page will show your temporary authorization code.
  - Copy this code and paste it (or just type it) onto the line in your command prompt after `Temporary Authentication Code ( Get one at https://login.fr.cloud.gov/passcode )>`.  Nothing will show up on the screen.  This is normal.  Hit return.
  - If it accepts the code, you will need to select the appropriate org to use for your cloud.gov session.
  - You should now be logged into cloud.gov and be ready to use the cloud foundry tools to push up your app.

3. Build your app.
  - Mostly on your own here, but a few considerations
  - Apps with just CRAN available packages are going to be much more straightforward.
  - External dependendices (e.g. gdal) are not yet figured out.  Jeff is still working on this.
  - Use the absolute minimum number of packages.  Adds considerably to the time to deploy the app and there is a 15 minute time out on cloud.gov that is pretty easy to hit.  Vendoring the packages might help.  Jeff is still working on this.
4. Set-up files needed for the cloud.gov push
  - r.yml
    - This file tells the r-buildpack what R packages are needed. it looks like:
    
```
---
packages: 
  - cran_mirror: https://cran.r-project.org
    packages:
      - name: dplyr
      - name: stringr
```
  - manifest.yml
    - This provides cloud.gov with all the clound foundry bits and pieces.  You can include almost all of these via the command line, but the manifest.yml provides a level of reproducibility so is preferrable.  A bare bones example looks like:
    
```
---
applications:
- name: myshinyapp
  buildpacks: 
  - https://github.com/cloudfoundry/r-buildpack.git 

```
  - Procfile
    - This is a one-line file that gets run once your cloud.gov instance has started.  For Shiny apps this starts the Shiny application.  It looks like:
    
```
web: R -f shiny.R
```
  - shiny.R
    - This is the R script that starts the Shiny app is what the Procfile points to.  It looks like

```
library(shiny)
runApp(host="0.0.0.0", port=strtoi(Sys.getenv("PORT")))
```


