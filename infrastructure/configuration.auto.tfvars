vnet_range            = "10.0.0.0/16"
subnet_range_firewall = "10.0.4.0/24"
subnets = [
  {
    name           = "blau"
    address_prefix = "10.0.1.0/24"
  },
  {
    name                              = "gelb"
    address_prefix                    = "10.0.2.0/24"
    private_endpoint_network_policies = "Disabled"
  },
  {
    name           = "gruen"
    address_prefix = "10.0.3.0/24"
  }
]


firewall_rules = [
  {
    name             = "rule1"
    source_addresses = ["10.0.0.0/16"]
    target_fqdns     = ["*.google.com"]
    protocols = [
      {
        port = "443"
        type = "Https"
      }
    ]
  },
  {
    name             = "rule2"
    source_addresses = ["192.168.1.0/24"]
    target_fqdns     = ["*.example.com"]
    protocols = [
      {
        port = "80"
        type = "Http"
      }
    ]
  }
]