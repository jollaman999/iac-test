# Defining VM Volume
resource "libvirt_volume" "ubuntu-focal-qcow2" {
  name = "ubuntu-focal.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "./ubuntu-focal.qcow2"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

data "template_file" "network_config" {
  template = "${file("${path.module}/net_cloud_init.cfg")}"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  pool = "default" # List storage pools using virsh pool-list
  user_data      = "${data.template_file.user_data.rendered}"
  network_config = "${data.template_file.network_config.rendered}"
}

# Define KVM domain to create
resource "libvirt_domain" "ubuntu-focal" {
  name   = "ubuntu-focal"
  memory = "2048"
  vcpu   = 2

  network_interface {
    network_name = "default" # List networks with virsh net-list
  }

  disk {
    volume_id = "${libvirt_volume.ubuntu-focal-qcow2.id}"
  }

  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
