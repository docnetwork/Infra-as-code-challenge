# Infra-as-Code-Challenge
DocNetwork's DevOps Challenge

## Challenge Details
The DevOps team at DocNetwork serve as the infrastructure engineers for the company. Strong competency with both AWS (or other cloud environments) and creating CI/CD pipelines are required for this position.

We don't want this challenge doesn't take too much of your personal time. We're all about MVP (**Minimum** Viable Product)! Give us the rubber bands and duct tape version of this project. We want to see how you approach the problem, not that you write the most perfect code in all the land.

What we are looking for is **Terraform code written to deploy an Auto Scaling Group (ASG) of web servers that deliver a website on AWS from a load balancer**. This should include the following:
1. VPC Configuration with subnets in multiple Availability Zones
2. EC2 Configuration
3. ELB to manage traffic
4. A running copy of the world's finest [Inspirational Quote Generator](https://github.com/docnetwork/InspirationalQuoteGenerator)

We love answering questions. Please send us your questions at the email address we sent you the challenge from. We're happy to help!

Also we understand this is an *infrastructure* challenge, and we've tried to make the application easy to manage. It's containerized, so starting the app should be as simple as running the container. We're more than happy to help with roadblocks here. Additionally, if you need to modify the application itself in any way, feel free to fork it and do so!

## Requirements
1. Runs on AWS Infrastructure.
2. The website is publicly accessible via the ELB.
3. The website should **not** be publicly accessible unless going through the ELB.
4. Code is documented in some way or another.

**Bonus Points** (not required at all) for *any* of the following:
* Include some form of CI/CD pipeline code. GitHub Actions, Jenkins, or any other tool is fine.
* Have the group of ASG's deliver said application via an ECS Cluster.
* Create and use variables so this can be used in multiple builds.
* Create a method to add linting or verifying that the code meets [Terraform style conventions](https://www.terraform.io/docs/language/syntax/style.html).

## Submission
Please [email a patch](https://thoughtbot.com/blog/send-a-patch-to-someone-using-git-format-patch) of your changes to the email address we sent you this challenge from. This allows us to see how you utilize git but ensures your submission isn't visible to everyone else. Pull Requests and Forks show everyone else your work.
> Note: you'll want to check out a new branch for your work to make correctly formatting the patch easier.
> ```
> git checkout -b my-branch
> ## make your changes, committing along the way
> git format-patch main --stdout > your-name.patch
> ```
