### Installing Serverless
1. Ensure that you have NPM installed
2. Run `npm install -g serverless`
3. Create a Serverless template- `serverless create --template aws-python3`
4. Update the `serverless.yml` to include the following line under `handler:`
   
```
    events:
      - http:
          path: /
          method: get
``` 
5. Run `serverless deploy`