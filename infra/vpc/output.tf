output "vpc_id" {
  value = aws_vpc.project04-vpc.id
}

output "public1-subnet-2a-id" {
    value = aws_subnet.project04-subnet-public1-2a.id
}

output "public2-subnet-2c-id" {
    value = aws_subnet.project04-subnet-public2-2c.id
}

output "private1-subnet-2a-id" {
    value = aws_subnet.project04-subnet-private1-2a.id
}

output "private2-subnet-2c-id" {
    value = aws_subnet.project04-subnet-private2-2c.id
}