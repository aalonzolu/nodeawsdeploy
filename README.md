# Node AWS Deploy to Elastic Beanstalk
![CI](https://github.com/aalonzolu/nodeawsdeploy/workflows/CI/badge.svg?branch=master)

# Docker Image
`aalonzolu/nodeawsdeploy`
## Features
##### Enable SSH
Command `enablessh` will generate a ssh key or copy (if is set) `SSH_PRIVATE_KEY` environment variable content to `~/.ssh/id_rsa`

#### Build NodeJS Apps
Installed packages
- node
- npm
- yarn

#### Deploy to S3
`aws s3 cp <source> s3://${BUCKET_NAME}/<bucket directory>/ --recursive`
Required environment variables:
- BUCKET_NAME
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION

#### Deploy to Beanstalk
```zip -r _app.zip . -x *.git*
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION
aws s3 cp _app.zip s3://$AWS_APP_S3/$AWS_APP_NAME-$CI_PIPELINE_ID.zip
aws elasticbeanstalk create-application-version --application-name $AWS_APP_NAME --version-label $AWS_APP_NAME-$CI_PIPELINE_ID --source-bundle S3Bucket=$AWS_APP_S3,S3Key=$AWS_APP_NAME-$CI_PIPELINE_ID.zip
aws elasticbeanstalk update-environment --application-name $AWS_APP_NAME --environment-name $AWS_ENV_NAME --version-label $AWS_APP_NAME-$CI_PIPELINE_I
```

Required environment variables:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- AWS_APP_NAME
- AWS_ENV_NAME
- AWS_APP_S3

# .gitlab-ci.yml example:
https://gist.github.com/aalonzolu/e5098cb7d2858018ce964b1a796bc599
