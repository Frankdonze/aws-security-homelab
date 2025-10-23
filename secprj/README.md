Summary
This is a project to get experience building out AWS infrastructure and connecting it my on prem proxmox server to simulate a hybrid corporate network. In this project I am going to try and focus more on security monitoring and build a secure stack. I will be restructuring the current on prem environment to make it more secure as well as building a wazuh server to create visibilty on security events to be monitored. 

Architecture Overview - Still being built will continue to update

Components:
	on-prem:
		Servers:
			proxmox server - 4 CPUs, 16GB RAM, 512GB SSD
				function - hypervisor
			pfsense VM - 2 vCPUs, 4GB RAM, 20GB disk
				function - router, firewall, DHCP, OPENVPN
		
		Network:
			LAN:
			  192.168.1.0/24 - Original Home Network from ISP that I use for set up and if I break everything
			VLANS:
			  vlan10:
				name: MGMT
				subnet: 10.10.10.0/24
			  
			  vlan20:
				name: Servers
			    	subnet:10.10.20.0/24

			  vlan30:
			    	name: clients
			    	subnet: 10.10.30.0/24

			  vlan40:
			 	name: DMZ
`				subnet 10.10.40.0/24

		
			OpenVPN - for remote connection to my lab from my laptop, and eventually from aws to on-prem
			  subnet: 10.8.0.0/24
			
	AWS:
	        Servers:
			Wazuh VM - 2 vCPUs, 8GB RAM, 8GB disk space
				function - SIEM
				security groups: SSH access
		
		
		Network:
			vpc:
			  name: secprj
			  subnet: 10.20.0.0/16

			subnets:
			  name: secprj-public-subnet
			  subnet: 10.20.1.0/24

			gateways:
			  Internet gateway: Secprj-igw attached
			  Virtual private gateway: vpg-secprj
			  Customer gateway: gateway-to-lan (associated with public facing ip to lan) 

			route tables:
			  name: secprjroutetable
			  	routes:
				0.0.0.0/0 - route to the internet gateway
				10.10.10.0/24 - route to virtual gateway or my ipsec vpn tunnel
				10.20.0.0/16 - route locally in aws enviornment
			
			VPN connections:
			  name: vpn-tunnel-secprj
			  static routes:
				10.10.10.0/24
				10.10.20.0/24
				10.10.30.0/24
				10.10.40.0/24
				
