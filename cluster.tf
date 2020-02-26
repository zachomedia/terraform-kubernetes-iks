resource "ibm_container_cluster" "cluster" {
  name       = "${var.name}"
  billing    = "hourly"
  datacenter = "${var.datacenter}"

  kube_version = "${var.kubernetes_version}"

  public_vlan_id  = "${data.ibm_network_vlan.public.id}"
  private_vlan_id = "${data.ibm_network_vlan.private.id}"

  public_service_endpoint  = false
  private_service_endpoint = true

  gateway_enabled = true

  machine_type      = "${var.node_size}"
  hardware          = "shared"
  default_pool_size = "${var.node_count}"
  disk_encryption   = true
}
