# Terraform-and-Packer-and-Jenkins

### Build script to use without Jenkins integration
```
chmod a+x build-and-launch.sh
sh build-and-launch.sh
```

### Build script to use with Jenkins
#### AWS Credentials
- To be able to upload to S3, you need to save your credentials in environment variables on your Jenkins:
  - AWS_DEFAULT_REGION=<region of bucket>
  - AWS_ACCESS_KEY_ID=<aws id>
  - AWS_SECRET_ACCESS_KEY=<your access key>

- To do that, just go to Jenkins - Manage Jenkins - Configure System - Global properties - Environment variables

#### Add Public Key to Jenkins Credentials
 - Add secret file in Manage Jenkins -> Manage Credentials -> Global -> Add Credentials -> Secret File

#### Create Jenkins Pipeline
 - Refer this repo in Jenkins
 - Select Configure
 - On the Configuration interface, under Build Environment, select Use secret text(s) or file(s).
 - Click Add -> Secret file. This creates a new Secret file binding.
 - Select Specific credentials, then from the drop-down menu below it select the secret file you would like to retrieve. Let's assume your secret file is stored under the filename id_rsa.pub
 - Assign to this secret file a variable e.g. id_rsa_pub
 - Now, under Build, click Add -> Execute shell
 - In the Command text area, add the following shell script:
```
rm -f $WORKSPACE/id_rsa.pub
cp $id_rsa_pub $WORKSPACE
```

 - Build script 2
```
ARTIFACT=`packer build -machine-readable packer-example.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
cat amivar.tf
terraform init
terraform apply -auto-approve -var 'key_pair="atingupta2005-terraform-packer"'  -var "PATH_TO_PUBLIC_KEY=$WORKSPACE/id_rsa.pub"
```

#### Test EC2 instance created from custom image
  - Take public IP of the new instance created
  - Open on browser to open nginx default page
  - Notice Custom Image created in EC2 Dashboard on AWS Console
