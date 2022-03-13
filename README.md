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
    uses: abhisek91/github-actions-jelastic@master
    with:
      jelastic_url: app.mycloud.by
      jelastic_username: ${{ secrets.JELASTIC_USERNAME }}
      jelastic_password: ${{ secrets.JELASTIC_TOKEN }}
      task: environment/control/getenvs
```

