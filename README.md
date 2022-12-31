# AWSEC2ELBCrossZoneLB
On-demand environments with IaC for client demo's & DEV/Test Enviornments. <br/> 
* Cross zone Load Balancing with Terraform. Deploy a Set of EC2 Instances behind an ALB. This Terraform code can very easily be extended for more complex enterprise grade infrastructure creation.<br/>
* Terraform is used to create the a reusable complex infrastructure which can be created and destroyed as many times as possible. Below is the architecture which would be created entirely through Terraform in AWS. The terraform code is complex and uploaded in the "sourcecode" folder. <br/>
* * **Good quality Cloud Architecture diagrams can be done easily in draw.io. It is a cloud based tool with minimal hassles.** <br/><br/>

![image](https://user-images.githubusercontent.com/92582005/210149141-ecea4e4a-95df-44d8-a0ac-db6000e11dd5.png) <br/><br/>

* Once the infrastructure is deployed then & the DNS of the ALB is viewed in browser the response will come from 1 of the 3 EC2 machines from different AZ's in us-west-2 region. When the page is refreshed then each time it can be seen that the response is coming from a different EC2 machine in different AZ as in the images below. <br/>
* The page displays the IP address & AZ of the EC2 machine sending the response. <br/>
* The shell Script in "awsuserdata.sh" bootstrapps the instances and prints the AZ & IP of the instances. It installs an apache server which listens of port 80. <br/> <br/>
* 

![image](https://user-images.githubusercontent.com/92582005/210150116-c3553e33-dab4-4224-8ecc-435562c2fac7.png) <br/><br/>

![image](https://user-images.githubusercontent.com/92582005/210150134-3ad9895c-5ff8-4679-9004-06ae60e12af1.png) <br/><br/>

![image](https://user-images.githubusercontent.com/92582005/210150145-02af0cb9-78d4-4718-ba05-9456cd51391c.png) <br/><br/>

* AWS resources deployed : <br/>
  * VPC - virtual private cloud <br/>
  * 3 Public Subnets <br/>
  * Internet Gateway <br/>
  * Public Route Tables <br/>
  * Security Groups <br/>
  * 3 EC2 Instances <br/>
  * Target Group <br/> 
  * Application Load Balancer <br/>
