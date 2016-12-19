#!/bin/sh

#download, convert and upload to repository.
wget http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2 -O centos.qcow2
sudo docker run --rm=true -v $PWD:/tmp schvin/qemu-img convert -p -O vpc centos.qcow2 centos.vhd
scp centos.vhd root@srep001.hay01.gdaas.com:/root/data/cloud/centos/


# determine ostype and register in cloudstack
echo "Info: Looking up ostypeid -> ${osdescription}"
ostypeid=$(sudo docker run --rm -v $PWD/data:/data -v $PWD/data/config:/cloudmonkey/config cloudstack/cloudstack-cloudmonkey list ostypes filter=id description="${osdescription}" | awk '/id = / {print $3}'|head -n 1)

if [ -z "${ostypeid}" ]; then
	echo "Error: Could not find ostypeid for ${osdescription}"
exit 1
fi
echo "Info: Found ostypeid ${ostypeid}"
sudo docker run --rm -v $PWD/data:/data -v $PWD/data/config:/cloudmonkey/config cloudstack/cloudstack-cloudmonkey register template name="${name}" displaytext="${SIZE}" isextractable=${extractable} isfeatured=${featured} ispublic=${public} passwordenabled=${passwordenabled} ostypeid=${ostypeid} format=${format} hypervisor=${hypervisor} zoneid=${zoneid} url="${url}/cloud/centos/centos.vhd"