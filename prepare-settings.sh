#!/bin/bash

##############################
# Variables to set

# VPN settings
vpn_server_name="vpnserver"
vpn_server_container_name="ovpn-data"
vpn_server_ip="192.168.4.100"
vpn_server_port="1194"
vpn_server_proto="udp"
vpn_server_dns_1="" # to set
vpn_server_dns_2="" # to set
vpn_server_network="10.8.0.0 255.255.255.0"
vpn_server_dev="tun"
vpn_server_dev_out="eth0"
vpn_server_network_different_mask="10.8.0.0/8"
vpn_server_keepalive="10 120"
vpn_server_cipher="AES-256-CBC"
vpn_server_user="nobody"
vpn_server_group="nogroup"
vpn_server_status_path="/etc/openvpn/openvpn-status.log"
vpn_server_log_path="/etc/openvpn/openvpn.log"
vpn_server_log_append_path="/etc/openvpn/openvpn.log"
vpn_server_verb="3"
vpn_server_exp_exit_not="1"
vpn_server_image="docker.io/kylemanna/openvpn"

# Ansible settings
ansible_user="" # to set
ansible_password="" # to set
ansible_port="" # to set
ansible_connection="" # to set

##############################

echo "*************************************************"

echo ""

echo "Welcome in set config script"

echo ""

echo "*************************************************"

echo ""

if [ ! -d group_vars ];
then

    echo "Create folder group_vars"
	
    mkdir group_vars
	
	echo ""
	
	echo "*************************************************"

	echo ""
	
fi

if [ ! -d host_vars ];
then

    echo "Create folder host_vars"
	
    mkdir host_vars
	
	echo ""
	
	echo "*************************************************"

	echo ""
	
fi

if [ ! -d inventory ];
then

    echo "Create folder inventory"
	
    mkdir inventory
	
	echo ""
	
	echo "*************************************************"

	echo ""
	
fi

if [ ! -f group_vars/centos8.yml ];
then
	echo "Create group_vars/centos8.yml"

	echo "ansible_user:" $ansible_user >> group_vars/centos8.yml

	echo ""

	echo "Set ansible vault"
	
	echo ""

	ansible-vault encrypt_string $ansible_password >> group_vars/centos8.yml

	sed -i 's/!/ansible_password: !/' group_vars/centos8.yml
	echo "ansible_port:" $ansible_port >> group_vars/centos8.yml
	echo "ansible_connection:" $ansible_connection >> group_vars/centos8.yml

	echo ""

	echo "*************************************************"

	echo ""

fi

if [ ! -f host_vars/vpn-server-podman.yml ];
then
    echo "Create host_vars/vpn-server-podman.yml"
	
	echo "ansible_host:" $vpn_server_ip >> host_vars/vpn-server-podman.yml
	
	echo ""
	
	echo "*************************************************"

	echo ""
	
fi

if [ ! -f inventory/inventory.yml ];
then

    echo "Create file inventory/inventory.yml"
    
	echo "all:" >> inventory/inventory.yml
	echo "  children:" >> inventory/inventory.yml
	echo "    centos8:" >> inventory/inventory.yml
	echo "      hosts:" >> inventory/inventory.yml
	echo "        vpn-server-podman:" >> inventory/inventory.yml
	
	echo ""
	
	echo "*************************************************"

	echo ""
	
fi

echo "Config file vars_files/var_file_strings.yml"

if [ $(grep -c vpn_server_name: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_name:" '"'$vpn_server_name'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_container_name: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_container_name:" '"'$vpn_server_container_name'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_ip: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_ip:" '"'$vpn_server_ip'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_port: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_port:" '"'$vpn_server_port'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_proto: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_proto:" '"'$vpn_server_proto'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dns_1: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dns_1:" '"'$vpn_server_dns_1'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dns_2: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dns_2:" '"'$vpn_server_dns_2'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_network: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_network:" '"'$vpn_server_network'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dev: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dev:" '"'$vpn_server_dev'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dev_out: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dev_out:" '"'$vpn_server_dev_out'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_network_different_mask: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_network_different_mask:" '"'$vpn_server_network_different_mask'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_keepalive: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_keepalive:" '"'$vpn_server_keepalive'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_cipher: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_cipher:" '"'$vpn_server_cipher'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_user: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_user:" '"'$vpn_server_user'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_group: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_group:" '"'$vpn_server_group'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_status_path: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_status_path:" '"'$vpn_server_status_path'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_log_path: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_log_path:" '"'$vpn_server_log_path'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_log_append_path: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_log_append_path:" '"'$vpn_server_log_append_path'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_verb: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_verb:" '"'$vpn_server_verb'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_exp_exit_not: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_exp_exit_not:" '"'$vpn_server_exp_exit_not'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_image: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_image:" '"'$vpn_server_image'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c ovpn_clients_vars: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ovpn_clients_vars:" >> vars_files/var_file_strings.yml
	echo "  # Items for vpn clients to create, example:" >> vars_files/var_file_strings.yml
	echo "  #- { ovpn_client_name: 'test', ovpn_client_pass: 'testpass' }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c ovpn_clients_to_remove: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ovpn_clients_to_remove:" >> vars_files/var_file_strings.yml
	echo "  # Items for vpn clients to remove, example:" >> vars_files/var_file_strings.yml
	echo "  #- test" >> vars_files/var_file_strings.yml
fi


echo ""
	
echo "*************************************************"

echo ""

echo "Configuration is ready"

echo ""
echo ""

echo "To create vpn server run:"

echo ""

echo "ansible-playbook -i inventory/inventory.yml install-openvpn-server.yml --ask-vault-pass"

echo ""
echo ""

echo "To create vpn client(s) run:"

echo ""

echo "ansible-playbook -i inventory/inventory.yml create-openvpn-clients.yml --ask-vault-pass"

echo ""
echo ""

echo "To delete vpn client(s) run:"

echo ""

echo "ansible-playbook -i inventory/inventory.yml delete-openvpn-client.yml --ask-vault-pass"

echo ""
echo ""

echo "To delete server and config run:"

echo ""

echo "./delete-server-and-config.sh"

echo ""
echo ""
	
echo "*************************************************"

echo ""