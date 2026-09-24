resource "vsphere_virtual_machine" "k8scontrolplane-prod01" {
  name = "k8scontrolplane-prod01"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  guest_id = data.vsphere_virtual_machine.template.guest_id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
    customize {
      linux_options {
        host_name = "k8scontrolplane-prod01"
        domain    = var.domain_name
      }
      network_interface {
        ipv4_address = var.k8scontrolplane_ip[0]
        ipv4_netmask = var.netmask
      }
      ipv4_gateway = var.gateway_ip
      dns_server_list = var.dns_servers
      dns_suffix_list = var.dns_suffixes
    }
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
  datastore_cluster_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  guest_id = data.vsphere_virtual_machine.template.guest_id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
  }
  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }
  cdrom {
    client_device = true
  }
}

resource "vsphere_virtual_machine" "k8sworker-prod02" {
  name = "k8sworker-prod02"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id     = data.vsphere_datastore_cluster.datastore_cluster.id
  guest_id = data.vsphere_virtual_machine.template.guest_id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
  }
  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }
  cdrom {
    client_device = true
  }
}