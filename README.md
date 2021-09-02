# Simple-API
Sample API for Automation Project

## Features
### Branch protection:
- Protection rules are enabled for <b>main</b> ( Production ) and <b>development</b> branches, ensuring no one can commit directly to them. Instead, a new branch has to be created for each new feature as pull requests are the only thing accepted in protected branches.

### Github actions:
- Tests: This script workflow ensures that the docker image can be built correctly and is in charge of running the tests. It executes on every push to <b>development</b> branch and in pull requests to <b>main</b>.

- Docker_build_and_push: This workflow executes whenever the <b>main</b> is modified and is in charge of pushing the new production images to dockerhub repository updating its tags. It uses github secrets for logging to docker hub and `github.run_number` to update tags.
  
### Tests:
- Sample tests with pytest for a more realistic CI/CD workflow.
  
### Docker: 
- Container based project for reproducibility, maintainability, and fit into a microservices ecosystem. The dockerfile is written using best practices, for better readability, maintainability, and shorter build times.

### Kubernetes:
- Kubernetes manifests that deploy and manage the API, create a service and an ingress load balancer that exposes the api and assing the /api endpoint.
- Kubernetes manifests that create and manage jenkins and sonarqube
- configmaps, pv, pvc, deployments, services, secrets, daemonsets...

### AWS:
- t3.medium instance to ensure we dont run low on resources.
- Instance type = spot instance (74% savings compared to aun demand EC2)
- run.sh script used on the first boot of the instance.
- Security group assigned to the instance that ensures that i am the only one taht can acces via ssh, thus guaranteeing the safety of this.
- Minikube as kubernetes cluster.