# bid-technical-challenge
A technical challenge for bid....

The core strengths of Elastic Beanstalk are:  you do not have to worry about the OS, 
Network Configuration, Database, Scaling, Load Balancing and Monitoring. This makes 
things easier for engineers as against setting every one of these, individually. 

For this challenge;

-	The packaging was done using S3.
-	Deployment was done using terraform. 
  Terraform is an iaC tool and has one of the best documentations out there.
-	The scaling was done using a setting parameter in the terraform.
-	For the security, the terraform.tfstate was ignored using the .gitignore file 
  while uploading to github. For the AWS side, the file is protected in transit 
  using AWS managed SSE using “AES256”. 
-	For monitoring, in the terraform, a setting parameter was added to the Elastic Beanstalk environment 
  which has a service linked role that handles monitoring through CloudWatch and scaling of EC2 as needed. 
  Also, there is an interface in elastic beanstalk that can be used to monitor the environment of your beanstalk. 
  It also has a graph for graphical monitoring of the elastic beanstalk. 
-	For troubleshooting, nothing much to troubleshoot as the health say “ok” and it is green. 
  But if the colour of the health was “red”, there would have been some things to check in order to troubleshoot it. 
  Some of them are;
o	checking the recent environment event, to see messages about elastic beanstalk deployment, load and configuration issues.
o	One can also pull logs to check recent log file entries.
o	Connect to instance to also check system resources.

