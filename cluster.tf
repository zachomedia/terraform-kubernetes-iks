resource "ibm_container_cluster" "cluster" {
  name       = var.name
  datacenter = var.datacenter

  kube_version       = var.kubernetes_version
  update_all_workers = true

  public_vlan_id  = var.vlan_public_id
  private_vlan_id = var.vlan_private_id

  public_service_endpoint  = false
  private_service_endpoint = true

  gateway_enabled = true

  machine_type      = var.node_size
  hardware          = "shared"
  default_pool_size = var.node_count
  disk_encryption   = true
}

# resource "null_resource" "cluster_addon_istio" {
#   provisioner "local-exec" {
#     command = "ibmcloud ks cluster addon enable istio --cluster '${ibm_container_cluster.cluster.name}'"
#   }
# }
