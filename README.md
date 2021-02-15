# oc-route
## Introduction
## Prerequisites
For this tutorial you will need:
- Sign up for your IBM Cloud account – 
- Register for the live stream and access the replay – https://www.crowdcast.io/e/secure-routes
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
- Create a new deployment resource using the [ibmcom/guestbook:v1](https://hub.docker.com/r/ibmcom/guestbook/tags) docker image in the project we just created.
```
oc new-app myguestbook --image=ibmcom/guestbook:v1
```
- This deployment creates the corresponding Pod that's in running state. Use the following command to see the list of pods in your namespace.
```
oc get pods
```
![get pods](https://user-images.githubusercontent.com/36239840/97298061-5534f280-186c-11eb-9dbb-982f2f1c20e0.JPG)

## Expose the route
- To view the service that we need to expose. Use the following command.<br>
```
oc get service
```
![get service](https://user-images.githubusercontent.com/36239840/97298080-5d8d2d80-186c-11eb-8574-e39b2cb48105.JPG)

- Expose the deployment
```
oc expose service myguestbook 
```
## Create a Passthrough Route
## Create an Edge Route
## Create a Re-encryption Route
## Summary
