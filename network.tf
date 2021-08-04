locals {
  vcn_id = var.create_vcn ? oci_core_vcn.internal[0].id : var.exist_vcn_id
  dhcp_options_id = var.create_vcn ? oci_core_vcn.internal[0].default_dhcp_options_id : var.exist_vcn_dhcp_options_id
}

resource "oci_core_vcn" "internal" {
  
  count = var.create_vcn ? 1 : 0
  
  dns_label      = var.vcn_dns_label
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_id
  display_name   = var.vcn_name
  freeform_tags  = var.app_tags
}

resource "oci_core_subnet" "oci-subnet" {
  vcn_id                      = local.vcn_id
  cidr_block                  = var.subnet_cidr_block
  compartment_id              = var.compartment_id
  display_name                = var.subnet_display_name
  dns_label                   = var.subnet_dns_label
  route_table_id              = oci_core_route_table.rand_route_table.id
  freeform_tags               = var.app_tags
  dhcp_options_id             = local.dhcp_options_id
  security_list_ids           = var.security_list_ids
}

resource "oci_core_route_table" "rand_route_table" {
    compartment_id = var.compartment_id
    vcn_id = local.vcn_id
    display_name = var.route_table_name
    freeform_tags = var.app_tags
    route_rules {
        network_entity_id = oci_core_internet_gateway.rand_internet_gateway.id
        description = "Internet route rule"
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
}

resource "oci_core_internet_gateway" "rand_internet_gateway" {
    compartment_id = var.compartment_id
    vcn_id = local.vcn_id
    enabled = true
    display_name = var.IG_name
    freeform_tags = var.app_tags
}

resource "oci_dns_zone" "dns_zone" {
    compartment_id = var.compartment_id
    name = var.dns_zone_name
    zone_type = var.dns_zone_type
    freeform_tags = var.app_tags
}

resource "oci_dns_rrset" "dns-records" {
    domain = oci_dns_zone.dns_zone.name
    rtype = "A"
    zone_name_or_id = oci_dns_zone.dns_zone.id
    compartment_id = var.compartment_id
    items {
        domain = oci_dns_zone.dns_zone.name
        rdata = var.instance_public_ip
        rtype = "A"
        ttl = 3600
    }
}