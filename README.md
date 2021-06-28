# Infra-as-Code-Challenge
DocNetwork's DevOps Challenge

## Challenge Details
The DevOps team at DocNetwork serve as the infrastructure engineers for the company. A good amount of familiarity with both AWS (or other cloud environments) is required for this position as well as familiarity with creating CI/CD pipelines.

We aim to make sure that this challenge doesn't take too much of your personal time. Two to Four hours is the expected time to complete. Don't worry about 

What we are looking for is **Terraform code written to deploy an Auto Scaling Group (ASG) of web servers that deliver a website on AWS from a load balancer**. This should include the following:
1. VPC Configuration with subnets in multiple Availability Zones
2. EC2 Configuration
3. ELB to manage traffic
4. Serves the world's finest [Inspirational Quote Generator](https://github.com/rbannal86/InspirationalQuoteGenerator)

## Requirements
1. Runs on AWS Infrastructure
2. The website is publicly accessible via the ELB.
3. The website should **not** be publicly accessible unless going through the ELB.
4. Code is documented in some way or another.

**Bonus Points** for any of the following:
1. Include some form of CI/CD pipeline code. GitHub Actions, Jenkins, GitLab, AWS CodePipeline or any other tool is fine.
2. Have the group of ASG's deliver said application via an ECS Cluster.
3. Create and use variables so this can be used in multiple builds
4. Create a method to add linting or verifying that the code meets [Terraform style conventions](https://www.terraform.io/docs/language/syntax/style.html)

## Submission
Please [email a patch](https://thoughtbot.com/blog/send-a-patch-to-someone-using-git-format-patch) of your changes to the email address we sent you this challenge from. This allows us to see how you utilize git but ensures your submission isn't visible to everyone else. Pull Requests and Forks show everyone else your work.
> Note: you'll want to check out a new branch for your work to make correctly formatting the patch easier.
> ```
> git checkout -b my-branch
> ## make your changes, committing alon the way
> git format-patch master --stdout > your-name.patch
> ```
