cf push simple_docker -k 2G --docker-image jhollist/simple_docker:firsttry --docker-username jhollist PORT=3838

https://github.com/cloudyr/googleComputeEngineR/blob/master/inst/dockerfiles/shiny-googleAuthRdemo/Dockerfile

https://ropenscilabs.github.io/r-docker-tutorial/




 - in local folder have shiny directory with app in it 
 - must have a Docker file on docker hub to use.  Chances are it will need to be in a repository you own as the docker file usually needs updates (libraries, packages, etc.)
 
 - Docker doesn't like paths with crazy things (like EPA One Drive). worked on simpler path /c/Users/JHollist...
 
- Shiny default port is 3838, cf/cloud.gov default port is 8080.

- some stuff on change ports of cf:  
  - https://gist.github.com/nota-ja/ef56ea0584ae2b37d6d3a535efe2d4ee
  - https://docs.cloudfoundry.org/devguide/custom-ports.html#procedure
  
- Or, could try resetting shiny to listen on 8080
  - Created new shiny-server.conf with LISTEN on 8080
  - updated image with docker build -t simple_docker:latest .
  - run locally docker run -p 8080:8080 simple_docker:latest
  - docker tag 61204e550e3b  jhollist/simple_docker:latest
  - docker push jhollist/simple_docker:latest
  
- now push
cli: cf push simple_docker3 --docker-image jhollist/simple_docker:latest --docker-username jhollist