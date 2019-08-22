variable "cloudflare_domain" {
  type    = string
}

variable "cloudflare_mailgun_txt_records" {
  type    = list(object({name=string, value=string}))
  default = []
}

variable "cloudflare_mailgun_mx_records" {
  type    = list(object({name=string, value=string}))
  default = []
}

variable "cloudflare_mailgun_tracking_record" {
  type    = object({name=string, value=string})
  default = null
}
