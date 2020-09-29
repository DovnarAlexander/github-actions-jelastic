# jelastic-docker-image
Includes Jelastic CLI installed in the Docker
## Usage
```bash
export JELASTIC_USERNAME=
docker run --rm -e "JELASTIC_USERNAME=$JELASTIC_USERNAME" -e "JELASTIC_PASSWORD=$JELASTIC_PASSWORD" -e "JELASTIC_URL=$JELASTIC_URL" jelastic:latest environment/control/getenvs
```