#!/bin/bash
vm_name=$1
key_name="/home/ansible/.ssh-keys/id_${vm_name}_rsa"
if [ -f "$key_name" ]; then
	exit 0
else
	ssh-keygen -t rsa -N '' -b 4096 -C "${vm_name} public key" -f $key_name
	chmod 400 $key_name
	# Use this command to backup to a third vm or location of your choice, e.g AWS S3 Bucket
	scp -P 9445 -i /home/ansible/.ssh/id_bak_server_rsa $key_name root@Location:/servers_keys_backup/
fi
echo $vm_name
echo $key_name
