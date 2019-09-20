resource "ibm_container_cluster" "cluster" {
  name       = "${var.name}"
  billing    = "hourly"
  datacenter = "${var.datacenter}"

  kube_version = "${var.kubernetes_version}"

  public_vlan_id  = "${data.ibm_network_vlan.public.id}"
  private_vlan_id = "${data.ibm_network_vlan.private.id}"

  machine_type      = "${var.node_size}"
  hardware          = "shared"
  default_pool_size = "${var.node_count}"
  disk_encryption   = true
}

resource "ibm_container_worker_pool" "pool1" {
  worker_pool_name = "pool1"
  cluster          = "${ibm_container_cluster.cluster.id}"
  machine_type     = "b3c.4x16"
  size_per_zone    = 1
  hardware         = "shared"
  disk_encryption  = true
}

resource "ibm_container_worker_pool_zone_attachment" "pool1" {
  cluster         = "${ibm_container_cluster.cluster.id}"
  worker_pool     = "${element(split("/",ibm_container_worker_pool.pool1.id),1)}"
  zone            = "${var.datacenter}"
  public_vlan_id  = "${data.ibm_network_vlan.public.id}"
  private_vlan_id = "${data.ibm_network_vlan.private.id}"
}
