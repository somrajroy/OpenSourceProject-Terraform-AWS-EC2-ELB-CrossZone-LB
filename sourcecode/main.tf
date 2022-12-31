resource "aws_vpc" "demo_vpc" {
  cidr_block           = var.custom_vpc
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}
/*only 3 subnets are created. But you can also create one subnet per AZ using data sources
please check the commented out codes on how to find out the count of AZ's in a region*/

resource "aws_subnet" "demo_public_subnet" {
  count                   = var.custom_vpc == "10.0.0.0/16" ? 3 : 0
  vpc_id                  = aws_vpc.demo_vpc.id
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  cidr_block              = element(cidrsubnets(var.custom_vpc, 8, 4, 4), count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-${count.index}"
  }
}

resource "aws_internet_gateway" "demo_internet_gateway" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo_igw"
  }
}


resource "aws_route_table" "demo_public_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "dev_public_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.demo_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demo_internet_gateway.id
}

resource "aws_route_table_association" "demo_public_assoc" {
  count          = length(aws_subnet.demo_public_subnet)
  route_table_id = aws_route_table.demo_public_rt.id
  subnet_id      = element(aws_subnet.demo_public_subnet.*.id, count.index)
}

/*
output "amiid" {
  value = data.aws_ami.server_ami.id
}
*/

#outputs the DNS name of the ELB which we can view in browser.
output "alb_dns" {
  value = aws_lb.load_balancer.dns_name
}


/*this will give us the number of AZ per region
output "az_length" {
  value = length(data.aws_availability_zones.azs.names)
}
*/