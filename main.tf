resource "vsphere_virtual_machine" "k8scontrolplane-prod01" {
  name = "k8scontrolplane-prod01"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }
}

resource "vsphere_virtual_machine" "k8sworker-prod01" {
  name = "k8sworker-prod01"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }
}

resource "vsphere_virtual_machine" "k8sworker-prod02" {
  name = "k8sworker-prod02"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }
}