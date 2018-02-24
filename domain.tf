# Create a new domain
resource "digitalocean_domain" "drone_ess" {
  name       = "drone.elsebasoy.cl"
  ip_address = "${digitalocean_droplet.drone.ipv4_address}"
}

# Add a record to the domain
resource "digitalocean_record" "www_drone_ess" {
  domain = "${digitalocean_domain.drone_ess.name}"
  type   = "A"
  name   = "www"
  value  = "${digitalocean_droplet.drone.ipv4_address}"
}
