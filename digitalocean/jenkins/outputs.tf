output "Jenkins_IP" {
    value = "${digitalocean_droplet.jenkins.ipv4_address}"
}

output "Jenkins_URL" {
    value = "http://${digitalocean_droplet.jenkins.ipv4_address}"
}
