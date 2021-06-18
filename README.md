# Infra-as-Code-Challenge
DocNetwork's DevOps Challenge

## Challenge Details
The DevOps team at DocNetwork serve as the infrastructure engineers for the company. A good amount of familiarity with both AWS (or other cloud environments) is required for this position as well as familiarity with creating CI/CD pipelines.

We aim to make sure that this challenge doesn't take too much of your personal time. Two to Four hours is the expected time to complete. Don't worry about 

What we are looking for is **Terraform code written to deploy an Auto Scaling Group (ASG) of web servers that deliver a website on AWS from a load balancer**. This should include the following:
1. VPC Configuration with subnets in multiple Availability Zones
2. EC2 Configuration
3. 

Please create you own fork of this repo. That way your code stays private and we don't run the risk of other people using your work. For code submission, either send us a .zip file of your repo or send an invite to your private repo. This 

## Bonus Points
1. Include some form of CI/CD pipeline code. GitHub Actions, Jenkins, GitLab, AWS CodePipeline or any other tool is fine..
2. Have the group of ASG's deliver said application via an ECS Cluster.
3. Create and use variables so this can be used in multiple builds
4. Create a method to add linting or verifying that the code meets [Terraform style conventions](https://www.terraform.io/docs/language/syntax/style.html)
5. Documentation inside your code where applicable. 
