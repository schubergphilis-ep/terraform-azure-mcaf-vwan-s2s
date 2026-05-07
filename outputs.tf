output "vpn_gateway_ids" {
  description = "Map of VPN Gateway IDs"
  value       = { for k, v in azurerm_vpn_gateway.this : k => v.id }
}

output "vpn_gateway_bgp_settings" {
  description = "Map of VPN Gateway BGP settings"
  value       = { for k, v in azurerm_vpn_gateway.this : k => v.bgp_settings }
}

output "vpn_gateway_nat_rule_ids" {
  description = "Map of VPN Gateway NAT rule IDs"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.this : k => v.id }
}

output "vpn_site_ids" {
  description = "Map of VPN Site IDs"
  value       = { for k, v in azurerm_vpn_site.this : k => v.id }
}

output "vpn_gateway_connection_ids" {
  description = "Map of VPN Gateway Connection IDs"
  value       = { for k, v in azurerm_vpn_gateway_connection.this : k => v.id }
}
