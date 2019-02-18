variable "tenant_id" { # Not secret information
  description = "The id of the Tenant."
  default     = "3ff3ac12e9a044049079822d465840c9"
}

variable "auth_url" {
  description = "The endpoint url to connect to OpenStack."
  default     = "https://cscloud.cf.ac.uk:5000"
}

variable "token" {} # This variable needs to be "declared" but is stored as an environment variable

variable "number_of_webservers" {
  description = "The number of webservers launched"
  default     = 2
}

variable "instance_names" {
  description = "A list of names to give the dynamically created servers."
  default = {
#  Index         Name
    "0"       = "Green"
    "1"       = "Blue"
  }
}
