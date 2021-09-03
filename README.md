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
- configmaps, pv, pvc, deployments, services, secrets...

### AWS:
- t3.medium instance to ensure we dont run low on resources.
- Instance type = spot instance (74% savings compared to aun demand EC2)
- run.sh script used on the first boot of the instance.
- Security group assigned to the instance that ensures that i am the only one taht can acces via ssh, thus guaranteeing the safety of this.
- Minikube as kubernetes cluster.

### Terraform:
- Used to automate the creation of AWS EC2 spot instance.
- It makes use of vars and a local file named terraform.tfvars(not uploaded) that contains the keys and passwords required to generate the instance with my IAM user, this is an important security feature.

### Shell scripts:
- This allows us to deploy and setup all the project with just a `sh run.sh` command.


### Sonarqube:
- Configured all the manifests but with vm.max_map_count [65530] is too low, increase to at least [262144] problem due to elasticsearch config on sonar docker image. Dont have time to debug it now.
### Problems found:
- Minikube ingress addon needs adding domain name and translating it to origin IP address via /etc/hosts file, which for some reason gives me problems on AWS, so even though i started developing on clout, i ended doing it locally because i dont have time to investigate it (I spent a few hours reading about this). https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/ https://stackoverflow.com/questions/57855957/access-minikube-ingress-without-setting-etc-hosts.
- vm.max_map_count [65530] is too low, increase to at least [262144] on sonarqube.