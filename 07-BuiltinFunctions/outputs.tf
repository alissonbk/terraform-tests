output "instance_public_ips" {
    value = aws_instance.instance.*.public_ip
}

output "instance_names" {
    value = join(", ", aws_instance.instance.*.tags.Name)
}