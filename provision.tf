resource "null_resource" "provisioner" {
    connection {
      host        = "${digitalocean_droplet.drone.ipv4_address}"
      user        = "${var.username}"
      private_key = "${file(var.priv_key_path)}"
      port        = "${var.port}"
    }

    provisioner "remote-exec" {
      inline = [
        "cd /tmp",
        "git clone https://github.com/jscatala/ansible_docker_rhel",
        "cd ansible_docker_rhel",
        "ansible-playbook docker.yml"
      ]
    }
}
