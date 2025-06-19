resource "oci_core_virtual_network" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = "10.0.0.0/16"
  display_name   = "vcn-LinuxAdmin"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "igw-LinuxAdmin"
}

resource "oci_core_route_table" "route" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "route-to-internet"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_subnet" "subnet" {
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  cidr_block        = "10.0.1.0/24"
  display_name      = "subnet-LinuxAdmin"
  route_table_id    = oci_core_route_table.route.id
  #dns_label         = "LinuxAdmin"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_security_list" "sec_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "sec-list-ssh-http"

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      min = 80
      max = 80
    }
  }

  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }
}

data "oci_core_images" "ubuntu_x86" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = "VM.Standard.E2.1.Micro"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  shape               = "VM.Standard.E2.1.Micro"
  display_name        = "lab-vm-Ubuntu"
  create_vnic_details {
    subnet_id = oci_core_subnet.subnet.id
  }
  source_details {
    source_type = "image"
        source_id = data.oci_core_images.ubuntu_x86.images[0].id
  }
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
  }
  shape_config {
    ocpus = 1
    memory_in_gbs = 1
  }
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}