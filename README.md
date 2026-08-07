# nkp-simple-gitops

This repository is meant to be used for a very simple GitOps setup in Nutanix Kubernetes Platform (NKP).

## What's in this repo?

The root of the repo contains this readme file and the following contents:

- __release__ folder contains the `demo-deployment.yaml` file for GitOps, which includes the example nginx kubernetes deployment and services.

- __resource__ folder contains the html files that I used to override the default nginx welcome page.

- __Dockerfiles__ that I used to create the example nginx docker images for this demo.

## How to do this demo?

Before using this repo, make sure you have access to a NKP environment with the privilege to create/edit projects in a workspace.

The instructions here assumed you have the basic knowledge of using NKP.

1. Login to your NKP dashboard, then navigate to your Workspace. Choose Projects on the sidebar menu and click `+ Create Project`.

2. Provide a Project Name (i.e. gitops-demo) and select a Cluster (if no cluster is shown then you'll have to create a cluster).

3. Once the project has been created, click `Continue to Project`.

4. Navigate to __Continuous Deployment (CD)__ tab and click `Add GitOps Source`.

5. On the GitOps Source configuration page, provide the following details:<br>
__Name:__ `nginx-demo`<br>
__Repository URL:__ `https://github.com/heynats/nkp-simple-gitops`<br>
__Git Ref Type:__ `Branch`<br>
__Branch Name:__ `main`<br>
__Path:__ `./release`

6. Once the details are filled in, save the configuration. This will set up the GitOps Source for your project.

7. Open the Kubernetes dashboard for the cluster associated with this project, you should be able to observe the demo deployment has been deployed to the namespace with the name that begins with the NKP Project Name provided in step 2.

8. In the Kubernetes dashboard, then navigate to the project namespace from the dropdown menu at the top. Click `Services` on the sidebar menu and you should find an external endpoint for the `nginx-gitops-demo-svc-ext` service.

9. Click the external endpoint link to open the nginx welcome page.

## Take the demo a step further

Once the demo nginx app has been deployed, we can quickly show that our GitOps setup is automatically handling CD.

1. To do this, please fork this GitHub repo so you can make alterations without affecting the original demo code base.

2. Once your own demo repository has been created, change the __Repository URL__ setting of the __Continuous Deployment (CD)__ setup in your NKP project. It should point to your GitHub repo instead, for example:<br>
`https://github.com/your-account/nkp-simple-gitops`

3. After changing the Repository URL, save the configuration. From here on you can change line 22 of the `demo-deployment.yaml` file, i.e. from `image: stanleyy/nginx-gitops-demo:red` to `image: stanleyy/nginx-gitops-demo:blue` or vice versa.

4. Commit to the repository after changing the image configuration, then go back to the Kubernetes dashboard to observe the rolling update.

5. After the rolling update is completed, open/refresh the nginx welcome page to observe background color change.
