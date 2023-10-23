########
### Prerequisites
- AWS Account
- GitHub Account
- Jenkins
- Nexus
- SonarQube
- Slack


# Steps
- Create Keypair
- Create Security group for Jenkins, Nexus and SonarQube
- Create EC2 instances for Jenkins, Nexus and SonarQube -> Use the shell scripts from the 'userdata' folder for installation
- Post Installation steps (Jenkins, Nexus, Sonarqube)
- Create a repo in Github
- Build Job with NexusRepo
- Setup GitHub Webhook and update Jenkins Job
- Code Analysis with SonarQube
- Publish Artifact to Nexus Repo
- Slack Notification

![Flow](CI-jenkins.jpg)


