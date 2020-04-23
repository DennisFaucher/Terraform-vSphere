variable "vsphere_server" {
    description = "vsphere server for the environment - EXAMPLE: vcenter01.hosted.local"
    default = "10.211.55.200"
}

variable "vsphere_user" {
    description = "vsphere server for the environment - EXAMPLE: vsphereuser"
    default = "administrator@vsphere.local"
}

variable "vsphere_password" {
    description = "vsphere server password for the environment"
    default = "Password"
}

variable "virtual_machine_dns_servers" {
  type    = "list"
  default = ["10.211.55.1", "8.8.8.8"]
}
