variable "do_droplet_size" {
    description = "Size of the droplet"
    default = "1gb"
}

variable "do_ssh_keys" {
    description = "List of valid SSH IDs/Fingerprints"
}

variable "do_token" {
    description = "DigitalOcean API Key"
}

variable "private_key" {
    description = "Path to SSH private key used to log into droplet"
}

