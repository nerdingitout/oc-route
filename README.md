# oc-route
## Introduction
## Prerequisites
For this tutorial you will need:
- Sign up for your IBM Cloud account – 
- Red Hat OpenShift Cluster 4 on IBM Cloud.
- oc CLI (can be downloaded from this link or you can use it at http://shell.cloud.ibm.com/.
## Estimated Time
It will take you around 30 minutes to complete this tutorial.
## Steps
- Login from the CLI & Create Project
## Setting up
In this section, you will view details about your OpenShift Cluster on IBM Cloud. Details you would be interested in are hostname, SSL Cert Secret Name, and the namespace that holds the secret.
- First, this is the Overview page that shows some details about your cluster like Cluster ID and resource group they can be useful when using ibmcloud CLI to grab some information about your cluster.
![image](https://user-images.githubusercontent.com/36239840/113106747-2b656a80-9214-11eb-82ef-4cc6efcd967b.png)
- on the top right, click on your profile and select "Log in to CLI and API"
![image](https://user-images.githubusercontent.com/36239840/113106901-551e9180-9214-11eb-8d61-15445a3b7215.png)
- Copy the IBM Cloud CLI login command and paste it in your CLI
![image](https://user-images.githubusercontent.com/36239840/113106986-6b2c5200-9214-11eb-857f-46d7dcdd266d.png)
![image](https://user-images.githubusercontent.com/36239840/113107025-75e6e700-9214-11eb-8a95-a04005b3002a.png)
- Select the resource group where your cluster resides (in my case it is default)
```
ibmcloud target -g default
```
![image](https://user-images.githubusercontent.com/36239840/113107089-8ac37a80-9214-11eb-948a-4b1548b5df81.png)
- View information about your cluster
```
ibmcloud oc nlb-dns ls --cluster <cluster_name_or_id>
```
![image (18)](https://user-images.githubusercontent.com/36239840/113107233-bcd4dc80-9214-11eb-8eae-25c4b6a2c201.png)

## Login from the CLI & Create Project
- Go to the web console and click on your username at the top right then 'Copy Login Command', then display the token and copy the ```oc login``` command in your terminal.<br>
![login](https://user-images.githubusercontent.com/36239840/97104809-26821500-16d0-11eb-936e-c2b7fb914523.JPG)<br>
- Create ```my-route-project``` project.
```
oc new-project my-route-project
```
## 
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
