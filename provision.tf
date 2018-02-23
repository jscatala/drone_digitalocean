resource "null_resource" "provisioner" {
    connection {
      host        = "${digitalocean_droplet.drone.ipv4_address}"
      user        = "root"
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    provisioner "remote-exec" {
      inline = [
        "yum update -y",
        "yum install -y wget ccze fail2ban logwatch git"
      ]
    }

    provisioner "remote-exec" {
      inline = [
        "cd /tmp",
        "wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
        "rpm -i epel-release-latest-7.noarch.rpm",
        "yum update -y",
      ]
    }

    provisioner "remote-exec" {
      inline = [
       "yum install -y python python-pip",
       "pip install -U pip",
       "pip install -U ansible" 
      ]
    }
   
    provisioner "remote-exec" {
      inline = [
        "cd /tmp",
        "git clone https://github.com/jscatala/ansible_docker_rhel",
        "cd ansible-role-docker",
        "ansible-playbook docker.yml"
      ]
    }
}
