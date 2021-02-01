# oc-route
## Introduction
## Prerequisites
For this tutorial you will need:
- Sign up for your IBM Cloud account – 
- Register for the live stream and access the replay – https://www.crowdcast.io/e/serverless-knative
- Red Hat OpenShift Cluster 4 on IBM Cloud. You can get it from
  - URL: 
  - Key: 
- oc CLI (can be downloaded from this link or you can use it at http://shell.cloud.ibm.com/.
## Estimated Time
It will take you around 30 minutes to complete this tutorial.
## Steps
- Login from the CLI & Create Project

## Login from the CLI & Create Project
- Go to the web console and click on your username at the top right then 'Copy Login Command', then display the token and copy the ```oc login``` command in your terminal.<br>
![login](https://user-images.githubusercontent.com/36239840/97104809-26821500-16d0-11eb-936e-c2b7fb914523.JPG)<br>
- Create ```my-route-project``` project.
```
oc new-project my-route-project
```
## Create Application
## Expose the route
## Create a Passthrough Route
## Create an Edge Route
## Create a TLS Route
## Summary
