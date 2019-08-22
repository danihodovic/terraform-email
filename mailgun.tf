resource "cloudflare_record" "mailgun_txt" {
  count  = length(var.cloudflare_mailgun_txt_records)
  domain = var.cloudflare_domain
  type   = "TXT"
  name   = var.cloudflare_mailgun_txt_records[count.index].name
  value   = var.cloudflare_mailgun_txt_records[count.index].value
}

resource "cloudflare_record" "mailgun_mx" {
  count    = length(var.cloudflare_mailgun_mx_records)
  domain   = var.cloudflare_domain
  type     = "MX"
  name     = var.cloudflare_mailgun_mx_records[count.index].name
  value    = var.cloudflare_mailgun_mx_records[count.index].value
  priority = 10
}

resource "cloudflare_record" "mailgun_tracking" {
  count = var.cloudflare_mailgun_tracking_record == null ? 0 : 1
  type    = "CNAME"
  domain  = var.cloudflare_domain
  name    = var.cloudflare_mailgun_tracking_record.name
  value   = var.cloudflare_mailgun_tracking_record.value
  proxied = false
}
