mock_provider "azurerm" {}

variables {
  resource_group = {
    name     = "rg-test"
    location = "westeurope"
  }

  virtual_wan_properties = {
    virtual_wan_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Network/virtualWans/vwan-test"
  }

  vpn_gateways = {
    test-gw = {
      name               = "vpngw-test"
      routing_preference = "Microsoft Network"
      scale_unit         = 1
      virtual_hub_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Network/virtualHubs/vhub-test"
    }
  }

  vpn_sites = {
    test-site = {
      name          = "vpnsite-test"
      address_cidrs = ["10.0.0.0/24"]
      links = [{
        name       = "link-test"
        ip_address = "1.2.3.4"
      }]
    }
  }

  vpn_site_connections = {
    test-conn = {
      name                 = "conn-test"
      vpn_gateway_name     = "test-gw"
      remote_vpn_site_name = "test-site"
      vpn_links = [{
        name                 = "link-conn-test"
        vpn_site_link_number = 0
        shared_key           = "test-shared-key"
        protocol             = "IKEv2"
        bgp_enabled          = false
      }]
    }
  }
}

# Test: basic module instantiation without NAT rules
run "basic_no_nat_rules" {
  command = plan

  assert {
    condition     = length(azurerm_vpn_gateway.this) == 1
    error_message = "Expected exactly one VPN gateway"
  }

  assert {
    condition     = length(azurerm_vpn_site.this) == 1
    error_message = "Expected exactly one VPN site"
  }

  assert {
    condition     = length(azurerm_vpn_gateway_connection.this) == 1
    error_message = "Expected exactly one VPN gateway connection"
  }

  assert {
    condition     = length(azurerm_vpn_gateway_nat_rule.this) == 0
    error_message = "Expected no NAT rules when vpn_gateway_nat_rules is empty"
  }
}
