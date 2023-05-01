#!/bin/bash

echo "*************************************************"

echo ""

echo "Deleting all configuration and components"

echo ""

echo "*************************************************"

echo ""

ansible-playbook -i inventory/inventory.yml delete-all.yml --ask-vault-pass

if [ -d group_vars ];
then
	rm -r group_vars
fi

if [ -d host_vars ];
then
	rm -r host_vars
fi

if [ -d inventory ];
then
	rm -r inventory
fi

sed -i '/vpn_server_name:/,$d' vars_files/var_file_strings.yml

echo "*************************************************"

echo ""

echo "Server and config are deleted"

echo ""

echo "*************************************************"

echo ""
