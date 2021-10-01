# Terraform-and-Packer

### AWS Credentials
- To be able to upload to S3, you need to save your credentials in environment variables on your Jenkins:
  - AWS_DEFAULT_REGION=<region of bucket>
  - AWS_ACCESS_KEY_ID=<aws id>
  - AWS_SECRET_ACCESS_KEY=<your access key>

- To do that, just go to Jenkins - Manage Jenkins - Configure System - Global properties - Environment variables


  
- Refer: https://github.com/atingupta2005/Packer-Terraform-Jenkins
- Refer this repo in Jenkins
- Build script -
```
chmod a+x build-and-launch.sh
sh build-and-launch.sh
```
