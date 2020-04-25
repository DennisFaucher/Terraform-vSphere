# Terraform-vSphere
Using Terraform to Automate vSphere VM Creation
## Why
My customers are all looking to see how Terraform fits in their multi-cloud strategy, so I figured some Terraform hands-on couldn't hurt. 
## Quick Demo Video
Here is a quick demo video of everything working: https://youtu.be/yJQRYbniFuA

Here is the complete tutorial VLOG: https://youtu.be/b-G2K3l-zzI

![Quick Demo](https://github.com/DennisFaucher/Terraform-vSphere/blob/master/Quick%20Demo.png)

## Requirements
* vSphere Environment with vCenter
* Virtual Machine Template
* Terraform Binary
### vSphere Environment with vCenter
If you already have a home lab or some other running vSphere/vCenter environment, awesome. As I seem to enjoy pain, I built a two ESXi host/vCenter environment in Parallels on my 16 GB RAM MacBook Pro. My MBP was _not_ happy but it worked. If you would like to do the same thing, these are the high-level steps:
* Install an ESXi host in Parallels
* Install a seconde ESXi host in Parallels
* In the first ESXi host, install the vCenter Server Appliance OVA and add both ESXi hosts to this vCenter
* Create a vCenter Data Center and Cluster using just the second ESXi host

All VMware software can be downloaded and installed without a license for 180 days
### Virtual Machine Template
* In the second ESXi host, create a CentOS VM and clone to a template. It is _very_ important that your master CentOS VM boots to a usable IP address before you clone to a template. Terraform will not run to completion nor successfully customize the new VM unless the new VM can be reached over IP.

When done, your vCenter will look something like this:

Hosts and Clusters

![Hosts](https://github.com/DennisFaucher/Terraform-vSphere/blob/master/Hosts.png)

VMs and Templates

![VMs](https://github.com/DennisFaucher/Terraform-vSphere/blob/master/Virtual%20Machines.png)



### Terraform Binary
One of the cool features of Terraform is that is consists of a single binary. You can download the binary for your operating system here: https://www.terraform.io/downloads.html. Binaries are available for macOS, FreeBSD, Linux, OpenBSD, Solaris and Windows

## Building and Running Terraform Configuration Files
I used the instructions in this tutorial as my base: https://www.virtualizationhowto.com/2018/05/basic-terraform-installation-and-vmware-vsphere-automation/

### Creating Your variables.tf File
Create a new directory somewhere to hold your configuration files. I created a directory named VMware.

variables.tf holds some of your sensitive configuration data such as your vCenter password. Download and edit the variables.tf in this repository to match your vCenter installation. 

### Creating Your build.tf File

build.tf defines the Terraform provider (vsphere) that will do the work as well as what work to do (clone a VM from template and then customize that VM). Download and edit the build.tf in this repository to match your VM creation needs. 

### Initializing the VMware Terraform Module

Once you have created your variables.tf and build.tf files in your new directory, run "terraform init" to download the Terraform vsphere provider module referenced in your build.tf file. You should see some progress messages like these:

Initializing the backend...

Initializing provider plugins...

- Checking for available provider plugins...
- Downloading plugin for provider "vsphere" (hashicorp/vsphere) 1.17.2...

Terraform has been successfully initialized!

### Testing the Configuration Before Applying

The "terraform plan" command will run through your build.tf, look for errors and tell you what would happen when you run "terrform apply" without actually applying the configuration. Run "terraform plan" and fix any syntax errors you may have.

### Applying the Configuration

The "terraform apply" command will make the changes defined in your build.tf configuration file. In the case of our test, create a new VM based on the VM template specified, power on the new VM, change the VM's IP address and hostname. At the successful completion of the "terraform apply" you should get a message like this one:

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

## Thank You

Thanks for your interest in this repository. Please contact me with any questions or feel free to open an issue with any errors I may have made.




