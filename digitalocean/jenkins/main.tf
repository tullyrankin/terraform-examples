provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_tag" "jenkins" {
    name = "jenkins"
}

resource "digitalocean_droplet" "jenkins" {
    image = "centos-7-0-x64"
    name = "jenkins"
    region = "sfo2"
    size = "${var.do_droplet_size}"
    private_networking = true
    ssh_keys = ["${var.do_ssh_keys}"]
    tags = ["${digitalocean_tag.jenkins.id}"]

    provisioner "remote-exec" {
        connection {
            user = "root"
            type = "ssh"
            private_key = "${file("${var.private_key}")}"
        }

        inline = [
            "export PATH=$PATH:/usr/bin",
            "yum makecache",
            "yum install -y docker",
            "systemctl start docker",
            "docker volume create jenkins_home",
            "docker run -d --name=jenkins --publish=80:8080 --publish=50000:50000 --volume=jenkins_home:/var/jenkins_home --restart=always jenkins",
        ]
    }
}
