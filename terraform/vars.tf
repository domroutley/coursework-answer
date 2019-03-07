variable "tenant_id" {
  description = "The id of the Tenant."
  default     = "3ff3ac12e9a044049079822d465840c9"
}

variable "auth_url" {
  description = "The endpoint url to connect to OpenStack."
  default     = "https://cscloud.cf.ac.uk:5000"
}

variable "token" {} # This variable needs to be "declared" but is stored as an environment variable

variable "subnet_1_CIDR" {
  description = "The CIDR for subnet 1"
  default     = "192.168.0.0/24"
}

variable "dev_access_key_name" {
  default = "dragon"
}

variable "dev_access_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClS6FHJDURSOxx5Kle4xQZ2mFXPE2Lvs5rFy2SFw1PJrLm4Ob+ZXw8xRgm4yOj60GU4psGaeADlZ7gsWPLa5yB2k8qjIttSSAfeLNGhU0l3MYrgjDCRZhVM45mzhudiU0R7dVlsTGT5fOGktiQCuJXEiE9680C4UbePuUnyOayFlRHw9bg/zttbglHLWpKEVgxSPmhszmYRtM0/sU9eCT3lk7QmMrErO6747v4KRfMLiqZ13wxt4NYmniDQ+bk7NSlcCOou2ZU7thV3zAd4WXLZYIjZdmu31PfUG4vmGSuwvT0WGjEZAAgXLc0T1GYrWY0lbFlhSgtPv8/J7ymnQiD dom@1Ap70P"
}

variable "prod_access_key_name" {
  default = "pheonix"
}

variable "prod_access_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAYmceMK5NQcwozc32s3l03efbleekifVBmkJoc+79Tm/j3iY8KOBsPpD3yblnURxK4aKPhsZsIwMp2soHLcitOSnPlFKfFFg+ELxDZTnyt25xPGpfBecXd4rPTEMS/1V0SOeYYWNgzqfzugsD9ORsfCRaUon81xNZC6rWQK0H9E0dwpQfU/woF2a8zqBZNoR9k2oPwZlZPfyaHFyQe4IP1jjWSIeqm7qe+KRRpBZ69+b10ngrlMQE2lslSQTz1HjtXRcfId/QhCItlZIKoLLS0n4di1oqfg5YbOOXDB/5CJOj7zNrZdeVPXFPI+WvcdwDzA1O34yU+S7tZteQOAgh dom@1Ap70P"
}

variable "image" {
  default = "Ubuntu Server 18.04.1"
}

variable "flavour" {
  default = "m1.micro"
}

variable "prod_ip" {
  default = "10.72.96.170"
}
