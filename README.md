# jelastic-docker-image
Includes Jelastic CLI installed in the Docker
## GitHub actions TBA
## Local usage
### Preparation
```bash
export JELASTIC_URL=<jelastic_api_fqnd>
export JELASTIC_USERNAME=<your_username>
export JELASTIC_PASSWORD=<your_password>
```
### Use from DockerHub
```bash
docker run --rm --env JELASTIC_URL --env JELASTIC_USERNAME --env JELASTIC_PASSWORD aliaksandrdounar/jelastic-cli:latest environment/control/getenvs
```
### Use from GitHub
```bash
echo TOKEN | docker login https://docker.pkg.github.com -u USERNAME --password-stdin
docker run --rm --env JELASTIC_URL --env JELASTIC_USERNAME --env JELASTIC_PASSWORD docker.pkg.github.com/dovnaralexander/jelastic-docker-image/jelastic-cli:latest environment/control/getenvs
```
