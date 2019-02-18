variable "tenant_id" { # Not secret information
  description = "The id of the Tenant."
  default     = "3ff3ac12e9a044049079822d465840c9"
}

variable "auth_url" {
  description = "The endpoint url to connect to OpenStack."
  default     = "https://cscloud.cf.ac.uk:5000"
}

variable "token" {} # This variable needs to be "declared" but is stored as an environment variable
