# Docusaurus in docker to Azure Web App Example
This is a sample project of how docusarus can be deployed to Azure Web App (also containing simple K8s manifest).

## Usage/Examples

### Azure Web App
Deployment to Azure Web App is done through GitHub Actions with relevant infrastructure deployed through terraform (locally). Currently the initial deployment needs to be done in order of ACR -> Build & Push to ACR -> Create Web App, but this can be easily fixed by including IaC into GitHub Actions, and using Docker provider to build and push the image.

### K8s
This project also contains simple K8s manifest which can be deployed to minikube and accessed locally.

```
# Start minikube
minikube start

# Build the image
docker build -t docusaurus-example:latest .

# Apply the manifest, update the image tag if needed
kubectl apply -f k8s/deployment.yaml 

# Access the site in the browser
minikube service docusaurus-service
```