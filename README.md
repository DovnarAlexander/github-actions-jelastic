# GitHub action for Jelastic CLI
Performs some actions via Jelastic CLI via API
## GitHub actions
### Inputs
#### `jelastic_url`
**Required**Jelastic API URL
#### `jelastic_username`
**Required**Jelastic Username
#### `jelastic_password`
**Required**Jelastic Password or API Token
#### `task`
**Required**Task to execute. More info [here](https://docs.jelastic.com/cli/).
### Outputs
#### `output`
Result JSON document returned from Jelastic.
### Example usage
```yaml
  - name: Run GetEnv command
    uses: DovnarAlexander/github-action-jelastic@master
    with:
      jelastic_url: app.mycloud.by
      jelastic_username: ${{ secrets.JELASTIC_USERNAME }}
      jelastic_password: ${{ secrets.JELASTIC_TOKEN }}
      task: environment/control/getenvs
```
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
