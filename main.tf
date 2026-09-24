resource "vsphere_virtual_machine" "k8scontrolplane-prod01" {
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  name = "k8scontrolplane-prod01"
}

resource "vsphere_virtual_machine" "k8sworker-prod01" {
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  name = "k8sworker-prod01"
}

resource "vsphere_virtual_machine" "k8sworker-prod02" {
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  name = "k8sworker-prod02"
}