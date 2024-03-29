### Open Source Project - AWS Cross Zone load balacing on-demand infrastructure with Terraform. Immutable infrastructure. <br/>
On-demand environments with IaC for client demo's & DEV/Test Enviornments. <br/> 
* Infrastructure-as-Code (IaC) is the key topic in Operational Exellence pillar of "AWS Well-Architected Framework". IaC enables customers to have consistent, templated, sandbox development, test, and production environments with increasing levels of operations control. Automation allows to create &  replicate workloads at low cost and avoid the expense of manual effort. Most importantly it allows for evolutionary architectures.<br/>
* In the cloud, customers can apply the same engineering discipline that they use for application code to their entire environment. They can define your entire workload (applications, infrastructure) as code and update it with code.By performing operations as code, customers can limit human error and enable consistent responses to events. <br/>
* This reusable infrastrucuture demonstrates AWS Cross zone Load Balancing with Terraform. Deploy a Set of EC2 Instances behind an ALB. This Terraform code can very easily be extended for more complex enterprise grade infrastructure creation.<br/>
* Terraform is used to create the below reusable complex infrastructure which can be created and destroyed as many times as possible. The terraform code is complex and uploaded in the "sourcecode" folder. <br/>
* **Good quality Cloud Architecture diagrams can be done easily in draw.io. It is a cloud based tool with minimal hassles.** <br/><br/>


![image](https://user-images.githubusercontent.com/92582005/210149141-ecea4e4a-95df-44d8-a0ac-db6000e11dd5.png) <br/><br/>
* Areas covered :
   * Operational Excellence Pillar of AWS Well Architecture (IaC) & templated infrastructure. <br/>
   * Automation : Creating reusable and repeatable infrastuctures.<br/>
   * Elastic Load Balancing (ELB) : ELB is an effective way to increase the availability of a system and distributes incoming traffic to application across several EC2 instances. <br/>
   * AWS Networking : VPC, Subnets, Route tables, Internet gateway, EIP's etc.<br/>
   * Bootstrapping <br/>
   * Terraform advanced <br/>
* Once the infrastructure is deployed then & the DNS of the ALB is viewed in browser the response will come from 1 of the 3 EC2 machines from different AZ's in us-west-2 region. When the page is refreshed then each time it can be seen that the response is coming from a different EC2 machine in different AZ as in the images below. <br/>
* The page displays the IP address & AZ of the EC2 machine sending the response as in below images. <br/>
* The shell Script in "awsuserdata.sh" bootstrap's the instances and prints the AZ & IP of the instances. It installs an apache server which listens of port 80. <br/> <br/>
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
