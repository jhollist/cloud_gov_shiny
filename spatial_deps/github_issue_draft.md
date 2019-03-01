What version of Cloud Foundry and CF CLI are you using? (i.e. What is the output of running `cf curl /v2/info && cf version`)?
This app is being pushed to cloud.gov - not sure the version running there.  The command returns:

```
{
   "description": "Unknown request",
   "error_code": "CF-NotFound",
   "code": 10000
}
cf.exe version 6.41.0+dd4c76cdd.2018-11-28
```                                                           
                                                           
What version of the buildpack you are using? 

1.0.7
                                                         
                                                         
If you were attempting to accomplish a task, what was it you were attempting to do?

I was attempting to use the r-buildpack to build a simple app that checks for the availability of the `rgdal` package. This is a test of using package with an external library dependency on  libproj-dev and libgdal-dev.  My app uses the apt-buildpack to manage these external dependencies.  The required r packages are vendored with the app.
                                                         
The app itself is available at https://github.com/jhollist/simple_deps
                                                         
What did you expect to happen?

I exepected the app to install and return a page that states " rgdal is available: TRUE"
                                                         
What was the actual behavior?

The `rgdal` package  fails to install as it is unable to locate the installed dependencies
                                                         
Please confirm where necessary:
* [ ] I have included a log output
* [ ] My log includes an error message
* [ ] I have included steps for reproduction
                                                         
                                                         