provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "drone" {
  # https://developers.digitalocean.com/documentation/v2/#images
  image    = "${var.image}"
  name     = "${var.server_name}"
  region   = "${var.region}"
  size     = "${var.size}"
  ssh_keys = ["${var.ssh_fp}"] 
}


