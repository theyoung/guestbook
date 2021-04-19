# Example: Guestbook application on Kubernetes

This directory contains the source code and Kubernetes manifests for PHP
Guestbook application.

Follow the tutorial at https://kubernetes.io/docs/tutorials/stateless-application/guestbook/.

## Capstone project

### Project Overview

- Working in AWS
- Using  Circle CI to implement Continuous Integration and Continuous Deployment
  - blue/green deployment or rolling deployment
  - must at least include typographical checking (aka “linting”)
- Building pipelines
  - Pushing the built Docker container(s) to the Docker repository 
  - Deploying these Docker container(s) to a small Kubernetes cluster
- Working with Ansible and CloudFormation to deploy clusters
- Building Kubernetes clusters
  - use AWS Kubernetes as a Service, or build your own Kubernetes cluster
- Building Docker containers in pipelines



### Steps in completing Your Project

#### Step 1: Propose and Scope the Project

- I used guestbook projects to verify blue green CICD pipeline with kubenetes and on AWS named as EKS clusters.
- It consists of three instances for frontend service and another tree instances for backend service with redis
![image](https://user-images.githubusercontent.com/6824701/115209797-e78dc300-a138-11eb-8993-47d873388bf0.png)


#### Step 2: Use Jenkins or Circle CI, and implement blue/green or rolling deployment.

- I used circle CI
- and I choose a blue/green update strategy with selector in k8s.

![image](https://user-images.githubusercontent.com/6824701/115209957-1441da80-a139-11eb-93f1-a09fed9406da.png)
![image](https://user-images.githubusercontent.com/6824701/115210631-bfeb2a80-a139-11eb-9317-27888d9561e4.png)


#### Step 3: Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster.

- I choose kubernetes cluster on aws

![image](https://user-images.githubusercontent.com/6824701/115210762-e14c1680-a139-11eb-8c20-f87f09f7dd69.png)


#### Step 4: Build your pipeline

- I built own my pipeline.
- You can check ./circleci/config.yml

#### Step 5: Test your pipeline

- ok, then I will show you current page. You can see title name 'Guestbook v2'
![image](https://user-images.githubusercontent.com/6824701/115211176-46a00780-a13a-11eb-9ef0-33f75a9a3f23.png)

- I am going to modify version information to v3. "php-redis>index.html"
![image](https://user-images.githubusercontent.com/6824701/115211370-77803c80-a13a-11eb-8648-3be3b1bc1405.png)

- Inspecting php codes to lint are via a phplint module on the build-frontend step.
![image](https://user-images.githubusercontent.com/6824701/115211660-bdd59b80-a13a-11eb-9ad4-cc76b68f729b.png)

##### Add a Failed Case
- To make sure, php linting is working well. modify the guestbook.php at the end of page.
![image](https://user-images.githubusercontent.com/6824701/115233498-f4b7ab80-a152-11eb-83f5-67bc06c5875c.png)
- Pipeling will be broken because the php file does not passed by linting
![image](https://user-images.githubusercontent.com/6824701/115233086-722eec00-a152-11eb-874f-17a7eb044577.png)


- Build docker Image modified and push it on my docker hub
![image](https://user-images.githubusercontent.com/6824701/115212143-2b81c780-a13b-11eb-9951-5c941903ec17.png)
![image](https://user-images.githubusercontent.com/6824701/115212205-39374d00-a13b-11eb-9400-2a055babd2ae.png)

- Setup EKS environments on the AWS. If there is no EKS environments existed, then automatically makes EKS on the AWS.
![image](https://user-images.githubusercontent.com/6824701/115212566-9e8b3e00-a13b-11eb-9656-007db50ebbdd.png)
![image](https://user-images.githubusercontent.com/6824701/115212753-d0040980-a13b-11eb-9c95-c23255515fe6.png)

- Configure backend Redis services with master and slave
![image](https://user-images.githubusercontent.com/6824701/115212877-f033c880-a13b-11eb-8424-4c0557c07de8.png)
![image](https://user-images.githubusercontent.com/6824701/115212977-0b063d00-a13c-11eb-8dbe-dbfc6dcbebc7.png)

- Deploy frontend services with COLOR to indicate blue/green status with curl test
![image](https://user-images.githubusercontent.com/6824701/115213134-31c47380-a13c-11eb-9626-7c73ce6dcc9d.png)

- If failed to deploy, then rollback before status.
![image](https://user-images.githubusercontent.com/6824701/115213316-5e788b00-a13c-11eb-8b08-c9ee0f823237.png)


Now you can browse this service with below a url.
http://a4fd555d73e53456cb7bf4a461f75621-412994592.us-west-2.elb.amazonaws.com/




