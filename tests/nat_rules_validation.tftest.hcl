mock_provider "azurerm" {}

variables {
  create_new_resource_group = false

  resource_group = {
    name     = "rg-test"
    location = "westeurope"
  }

  virtual_wan_properties = {
    virtual_wan_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Network/virtualWans/vwan-test"
  }

  vpn_gateways = {
    hub = {
      name               = "vpngw-hub"
      routing_preference = "Microsoft Network"
      scale_unit         = 1
      virtual_hub_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Network/virtualHubs/vhub-test"
    }
  }

  vpn_sites            = {}
  vpn_site_connections = {}
}

# Test: invalid mode is rejected
run "invalid_nat_rule_mode" {
  command = plan

  variables {
    vpn_gateway_nat_rules = {
      bad-rule = {
        name                   = "nat-rule-bad"
        vpn_gateway_name       = "hub"
        mode                   = "InvalidMode"
        internal_address_space = "192.168.1.0/24"
        external_address_space = "172.16.111.0/24"
      }
    }
  }

  expect_failures = [
    var.vpn_gateway_nat_rules,
  ]
}

# Test: invalid type is rejected
run "invalid_nat_rule_type" {
  command = plan

  variables {
    vpn_gateway_nat_rules = {
      bad-rule = {
        name                   = "nat-rule-bad"
        vpn_gateway_name       = "hub"
        mode                   = "IngressSnat"
        type                   = "InvalidType"
        internal_address_space = "192.168.1.0/24"
        external_address_space = "172.16.111.0/24"
      }
    }
  }

  expect_failures = [
    var.vpn_gateway_nat_rules,
  ]
}
