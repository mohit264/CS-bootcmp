### Deploying Terraform via GitHub Actions
1. az login
2. Post login copy subscription id
3. Create Service Principal to authenticate to terraform
CLI: az ad sp create-for-rbac -n "TerraformSP" --role contributor --scopes /subscriptions/{your-subscription-id-without-brackets}
4. This will create an app to authenticate and will provide json. We will need appid, name and password
5. Then go to your github repository settings and create the repo secret Name as "AZURE_CREDENTIALS" and provide information as per below format
```{
  "clientId": "{your-app-id-without-brackets}",
  "clientSecret": "{your-app-pwd-without-brackets}",
  "subscriptionId": "{subscription-id-without-brackets}",
  "tenantId": "{tenant-id-without-brackets}"
}```
6. Create one more secret for Terraform with name as ARM_CLIENT_SECRET and value will be the client secret without quotes and brackets
7. Now it's time to setup the pipeline from the scratch.
8. Refer the Hashicorp documentation for Authenticating using service principal. Need to add environment variables in pipeline under build as per below format
```env:
  ARM_SUBSCRIPTION_ID: 'subscription-id'
  ARM_TENANT_ID: 'tenant-id'
  ARM_CLIENT_ID: 'app-id'
  ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}```
Also create variable for storage name as terraform tf script is accepting as variable
9. Go to market place and search for Azure login snippet and set creds to Secret configured
10. Search Setup Terraform in Market place and grab the snippet