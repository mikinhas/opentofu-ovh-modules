module "dns" {
  source = "../.."

  zone = "example.com"

  records = {
    root_a = {
      fieldtype = "A"
      target    = "203.0.113.10"
    }

    root_aaaa = {
      fieldtype = "AAAA"
      target    = "2001:db8::1"
    }

    www = {
      subdomain = "www"
      fieldtype = "CNAME"
      target    = "example.com."
    }

    api = {
      subdomain = "api"
      fieldtype = "A"
      target    = "203.0.113.20"
      ttl       = 300
    }

    mx_primary = {
      fieldtype = "MX"
      target    = "10 mail.example.com."
    }

    spf = {
      fieldtype = "TXT"
      target    = "\"v=spf1 mx -all\""
    }

    dmarc = {
      subdomain = "_dmarc"
      fieldtype = "TXT"
      target    = "\"v=DMARC1; p=reject; rua=mailto:dmarc@example.com\""
    }
  }

  # Optional: override the domain's name servers at the registrar level.
  # Only works for domains registered with OVH. Remove or leave commented to
  # keep OVH's existing name servers.
  #
  # name_servers = [
  #   "ns1.example-dns.net",
  #   "ns2.example-dns.net",
  # ]
}
