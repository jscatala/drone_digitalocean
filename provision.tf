resource "null_resource" "provisioner" {
    connection {
      host        = "${digitalocean_droplet.drone.ipv4_address}"
      user        = "root"
      private_key = "${file("~/.ssh/id_rsa")}"
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
