# Notes on setting up shiny on cloud.gov via dockerfile

1. get access to cloud.gov
2. install cloud foundry
3. log into cloud.gov with cloud foundry
4. choose docker file to push
5. make sure docker file has EXPOSE set to 3838
  - already set in the rocker/shiny docker file
  - not sure why problem on cloud.gov side
  - try to figure out how to adjust dockerfile to run shiny from 80
6. push docker file to cloud.gov
7. Other resources:
  - https://pivotalsoftware.github.io/gp-r/#shiny_cf

