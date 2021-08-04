output "comparement_id" {
  value = var.compartment_id
}

output "vcn_id" {
  value = var.create_vcn ? oci_core_vcn.internal[0].id : var.exist_vcn_id
}

output "vcn_cidr" {
  value = var.create_vcn ? oci_core_vcn.internal[0].cidr_block : null
}

output "vcn_dhcp_options_id" {
  value = var.create_vcn ? oci_core_vcn.internal[0].default_dhcp_options_id : var.exist_vcn_dhcp_options_id
}

output "route_table_id" {
    value = oci_core_route_table.rand_route_table.id
}

output "internet_gateway_id" {
    value = oci_core_internet_gateway.rand_internet_gateway.id
}

output "dns_zone_id" {
    value = oci_dns_zone.dns_zone.id
}

output "dns_rrset_id" {
    value = oci_dns_rrset.dns-records.id
}

output "subnet_id" {
    value = oci_core_subnet.oci-subnet.id
}

output "subnet_security_list_id" {
    value = oci_core_subnet.oci-subnet.security_list_ids
}