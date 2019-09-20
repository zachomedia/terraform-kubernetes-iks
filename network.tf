# Public VLAN
# TODO: Create one
data "ibm_network_vlan" "public" {
  name = "${var.vlan_public}"
}

# Private VLAN
# TODO: Create one
data "ibm_network_vlan" "private" {
  name = "${var.vlan_private}"
}
