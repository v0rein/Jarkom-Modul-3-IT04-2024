echo ' 
subnet 192.235.1.0 netmask 255.255.255.0 {
range 192.235.1.05 192.235.1.25;
range 192.235.1.50 192.235.1.100;
option routers 192.235.1.1;
option broadcast-address 192.235.1.255;
option domain-name-servers 192.235.4.3;
default-lease-time 360;
max-lease-time 5220;
}

subnet 192.235.2.0 netmask 255.255.255.0 {
range 192.235.2.09 192.235.2.27;
range 192.235.2.81 192.235.2.243;
option routers 192.235.2.1;
option broadcast-address 192.235.2.255;
option domain-name-servers 192.235.4.3;
default-lease-time 1800;
max-lease-time 5220;
}

subnet 192.235.3.0 netmask 255.255.255.0 {
}

subnet 192.235.4.0 netmask 255.255.255.0 {
}


' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart