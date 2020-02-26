# Cluster
variable "name" {}
variable "datacenter" {}
variable "kubernetes_version" {}

## Nodes
variable "node_size" {
  default = "b3c.4x16"
}

variable "node_count" {
  default = 1
}

variable "edge_node_size" {
  default = "b3c.4x16"
}

variable "edge_node_count" {
  default = 1
}


# Network
variable "vlan_public_id" {}
variable "vlan_private_id" {}
