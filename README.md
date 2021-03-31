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
- Setting up
- Create Application
- Expose the Route
## Login from the CLI & Create Project
- Go to the web console and click on your username at the top right then 'Copy Login Command', then display the token and copy the ```oc login``` command in your terminal.<br>
![login](https://user-images.githubusercontent.com/36239840/97104809-26821500-16d0-11eb-936e-c2b7fb914523.JPG)<br>
- Create ```my-route-project``` project.
```
oc new-project my-route-project
```
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

## Create Application
- Create a new deployment resource using the [ibmcom/guestbook:v2](https://hub.docker.com/r/ibmcom/guestbook/tags) docker image in the project we just created.
```
oc new-app myguestbook --image=ibmcom/guestbook:v1
```
- This deployment creates the corresponding Pod that's in running state. Use the following command to see the list of pods in your namespace.
```
oc get pods
```
![get pods](https://user-images.githubusercontent.com/36239840/97298061-5534f280-186c-11eb-9dbb-982f2f1c20e0.JPG)
- reate a Kubernetes ClusterIP service for your app deployment. The service provides an internal IP address for the app that the router can send traffic to.
```
oc expose deployment myguestbook --type="NodePort" --port=3000
```
## Expose the route
- To view the service that we need to expose. Use the following command.<br>
```
oc get svc
```
![image](https://user-images.githubusercontent.com/36239840/113107705-484e6d80-9215-11eb-8b4c-3ff6ff9f0895.png)
- Notice that the application isn't accessible externally, we have only exposed the deployment internally, to make it externally accessible use the following command
```
oc expose svc myguestbook 
```
- Now to get the route using the following command
```
oc get routes
```
![image (20)](https://user-images.githubusercontent.com/36239840/113109494-1c33ec00-9217-11eb-8c96-675a6efdff35.png)
- copy and paste the link in your browser, you will be redirected to a web page like the following screenshot. Notice that the webpage is not secure because we haven't used any type of encryption yet.
![image](https://user-images.githubusercontent.com/36239840/113109564-281fae00-9217-11eb-843c-6a01474ace7a.png)
- Since you will be using the same application to create an edge route, make sure to delete the route before moving to the next step
```
oc delete route myguestbook
```
## Create a Passthrough Route
## Create an Edge Route
## Create a Re-encryption Route
## Summary
