# NodeJS AWS Deploy
![CI](https://github.com/aalonzolu/nodeawsdeploy/workflows/CI/badge.svg?branch=master)

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
