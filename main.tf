resource "phpipam_first_free_address" "control_plane" {
  count       = var.control_plane_count
  subnet_id   = var.phpipam_subnet_id
  hostname    = "k8scontrolplane-prod0${count.index + 1}.${var.domain_name}"
  description = "Terraform managed Kubernetes control plane"
}

resource "phpipam_first_free_address" "worker" {
  count       = var.worker_count
  subnet_id   = var.phpipam_subnet_id
  hostname    = "k8sworker-prod0${count.index + 1}.${var.domain_name}"
  description = "Terraform managed Kubernetes worker"
}

resource "vsphere_virtual_machine" "k8scontrolplane" {
  count                = var.control_plane_count
  name                 = "k8scontrolplane-prod0${count.index + 1}"
  resource_pool_id     = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id = data.vsphere_datastore_cluster.datastore_cluster.id
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  
  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
    customize {
      linux_options {
        host_name = "k8scontrolplane-prod0${count.index + 1}"
        domain    = var.domain_name
      }
      network_interface {
        ipv4_address = phpipam_first_free_address.control_plane[count.index].ip_address
        ipv4_netmask = var.netmask
      }
      ipv4_gateway    = var.gateway_ip
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

resource "vsphere_virtual_machine" "k8sworker" {
  count                = var.worker_count
  name                 = "k8sworker-prod0${count.index + 1}"
  resource_pool_id     = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id = data.vsphere_datastore_cluster.datastore_cluster.id
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  
  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
    customize {
      linux_options {
        host_name = "k8sworker-prod0${count.index + 1}"
        domain    = var.domain_name
      }
      network_interface {
        ipv4_address = phpipam_first_free_address.worker[count.index].ip_address
        ipv4_netmask = var.netmask
      }
      ipv4_gateway    = var.gateway_ip
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
