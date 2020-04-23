# Terraform-vSphere
Using Terraform to Automate vSphere VM Creation
## Why
My customers are all looking to see how Terraform fits in their multi-cloud starategy, so I figured some Terraform hands-on couldn't hurt. 
## Quick Demo Video
Demo Video: https://youtu.be/yJQRYbniFuA
## Requirements
* vSphere Environment with vCenter
* Virtual Machine Template
* Terraform Binary
## How
### vSphere Environment with vCenter
If you already have a home lab or some other running vSphere/vCenter environment, awesome. As I seem to enjoy pain, I built a two ESXi host/vCenter environment in Parallels on my 16 GB RAM MacBook Pro. My MBP was _not_ happy but it worked. If you would like to do the same thing, these are the high-level steps:
* Install an ESXi host in Parallels
* Install a seconde ESXi host in Parallels
* In the first ESXi host, install the vCenter Server Appliance OVA and add both ESXi hosts to this vCenter
* Create a vCenter Data Center and Cluster using just the second ESXi host
### Virtual Machine Template
* In the second ESXi host, create a CentOS VM and clone to a template
When done, your vCenter will look something like this:
### Terraform Binary
One of the cool features of Terraform is that is consists of a single binary. You can download the binary for your operating system here: https://www.terraform.io/downloads.html Binaries are available for macOS, FreeBSD, Linux, OpenBSD, Solaris and Windows
