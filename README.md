# jelastic-docker-image
Includes Jelastic CLI installed in the Docker
## Usage
```bash
export JELASTIC_URL=<jelastic_api_fqnd>
export JELASTIC_USERNAME=<your_username>
export JELASTIC_PASSWORD=<your_password>

docker run --rm --env JELASTIC_URL --env JELASTIC_USERNAME --env JELASTIC_PASSWORD jelastic:latest environment/control/getenvs
```