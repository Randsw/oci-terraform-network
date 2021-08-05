variable "compartment_id" {
    type = string
}

variable "compartment_state" {
    type = string  
    default = "ACTIVE"
}

variable "compartment_access_level" {
    type = string
    default = "ACCESSIBLE"
  
}

variable "app_tags" {
    type = map(string)  
}

variable "vcn_dns_label" {
    type = string
}

variable "vcn_cidr_block" {
    type = string
}

variable "vcn_name" {
    type = string
}

variable "subnet_cidr_block" {
    type = string
}

variable "subnet_display_name" {
  type = string
}

variable "subnet_dns_label" {
    type = string
}

variable "route_table_name" {
    type = string
}

variable "IG_name" {
    type = string
}

variable "dns_zone_name" {
    type = string
}

variable "dns_zone_type" {
    type = string
}

variable "security_list_ids" {
    type = list(string)
}

variable "instance_public_ip" {
    type = string
}

variable "create_vcn" {
    type = bool
}

variable "exist_vcn_id" {
    type = string
}

variable "exist_vcn_dhcp_options_id" {
    type = string
}

variable "create_dns_zone" {
    type = bool
}

variable "create_dns_record" {
    type = bool  
}

variable "exist_dns_zone_name" {
    type = string
}

variable "exist_dns_zone_id" {
    type = string
}

variable "domain_record" {
    type = list(map(string)) 
}