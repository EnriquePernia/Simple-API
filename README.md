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