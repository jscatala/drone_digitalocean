output "drone_ip" {
  value = "${digitalocean_droplet.drone.ipv4_address}"
}
