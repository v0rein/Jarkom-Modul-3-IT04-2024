# Jarkom-Modul-3-IT04-2024
|Nama  | NRP |
|--|--|
| Dionisius Marcell Putra Indranto | 502723044 |
| Aswalia Novitriasari		   | 5027231012|

# Topologi
![image](https://github.com/user-attachments/assets/9fcdc9f6-bf6d-402a-a055-fb9d2f542433)

# Konfigurasi
### Paradis
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.235.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.235.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.235.3.1
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 192.235.4.1
	netmask 255.255.255.0
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.235.0.0/16
```
### Armin
```
auto eth0
iface eth0 inet static
	address 192.235.2.2
	netmask 255.255.255.0
  gateway 192.235.2.1
```
### Eren
```
auto eth0
iface eth0 inet static
	address 192.235.2.3
	netmask 255.255.255.0
    gateway 192.235.2.1
```
### Mikasa
```
auto eth0
iface eth0 inet static
	address 192.235.2.4
	netmask 255.255.255.0
    gateway 192.235.2.1
```
### Zeke, Erwin 
```
auto eth0
iface eth0 inet dhcp
```
### Fritz
```
auto eth0
iface eth0 inet static
	address 192.235.4.3
	netmask 255.255.255.0
	gateway 192.235.4.1
```
### Tybur 
```
auto eth0
iface eth0 inet static
	address 192.235.4.2
	netmask 255.255.255.0
	gateway 192.235.4.1
```
### Warhammer 
```
auto eth0
iface eth0 inet static
	address 192.235.3.2
	netmask 255.255.255.0
	gateway 192.235.3.1
```
### Colossal
```
auto eth0
iface eth0 inet static
	address 192.235.3.4
	netmask 255.255.255.0
	gateway 192.235.3.1
```
### Beast
```
auto eth0
iface eth0 inet static
	address 192.235.3.3
	netmask 255.255.255.0
	gateway 192.235.3.1
```
### Annie
```
auto eth0
iface eth0 inet static
	address 192.235.1.2
	netmask 255.255.255.0
	gateway 192.235.1.1
```
### Berth
```
auto eth0
iface eth0 inet static
	address 192.235.1.3
	netmask 255.255.255.0
	gateway 192.235.1.1
```

### Reiner 
```
auto eth0
iface eth0 inet static
	address 192.235.1.4
	netmask 255.255.255.0
	gateway 192.235.1.1
```
Pulau Paradis dan Marley, sama-sama menghadapi ancaman besar dari satu sama lain. Keduanya membangun infrastruktur pertahanan yang kuat untuk melindungi sistem vital mereka. Dengan strategi yang matang, mereka bersiap menghadapi serangan dan mempertahankan wilayah masing-masing.
Bangsa Marley, dipimpin oleh Zeke, telah mempersiapkan Annie, Bertholdt, dan Reiner untuk menyerang menggunakan Laravel Worker. Di sisi lain, Klan Eldia dari Paradis telah mempersiapkan Armin, Eren, dan Mikasa sebagai PHP Worker untuk mempertahankan pulau tersebut. Warhammer bertindak sebagai Database Server, sementara Beast dan Colossal sebagai Load Balancer.

### Bash Files

- Paradis (DHCP Relay)

```bash
apt-get update
apt install isc-dhcp-relay -y
service isc-dhcp-relay start
```

- Tybur (DHCP Server)

```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf   # DNS Server
apt-get update
apt install isc-dhcp-server -y
echo INTERFACES="eth0" > /etc/default/isc-dhcp-server
echo 'nameserver 192.235.4.3' > /etc/resolv.conf
```

- Fritz (DNS Server)

```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
```

- Warhammer (Database Server)

```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install mariadb-server -y
service mysql start
```

- Colossal (Load Balancer)

```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install apache2-utils -y
apt-get install php7.3 php-fpm -y
apt-get install nginx -y
apt-get install lynx -y

echo 'nameserver 192.235.4.3' > /etc/resolv.conf
```

- Armin, Eren, Mikasa (PHP Worker)

```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install nginx -y
apt-get install wget -y
apt-get install unzip -y
apt-get install lynx -y
apt-get install htop -y
apt-get install apache2-utils -y
apt-get install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip -y
echo 'nameserver 192.235.4.3' > /etc/resolv.conf   # DNS Server

service nginx start
service php7.3-fpm start
```

- Annie, Bertholdt, Reiner (Laravel Worker)

```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install mariadb-client -y
apt-get install lynx -y
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.li$apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl $apt-get install nginx -y
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
apt-get install git -y
git clone https://github.com/martuafernando/laravel-praktikum-jarkom /var/www/laravel-praktikum-jarkom
composer update
composer install
```

- Zeke, Erwin (Client)

```bash
apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y
```

## No. 1
Pulau Paradis telah menjadi tempat yang damai selama 1000 tahun, namun kedamaian tersebut tidak bertahan selamanya. Perang antara kaum Marley dan Eldia telah mencapai puncak. Kaum Marley yang dipimpin oleh Zeke, me-register domain name marley.yyy.com untuk worker Laravel mengarah pada Annie. Namun ternyata tidak hanya kaum Marley saja yang berinisiasi, kaum Eldia ternyata sudah mendaftarkan domain name eldia.yyy.com untuk worker PHP (0) mengarah pada Armin.

Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

Jauh sebelum perang dimulai, ternyata para keluarga bangsawan, Tybur dan Fritz, telah membuat kesepakatan sebagai berikut:
Semua Client harus menggunakan konfigurasi ip address dari keluarga Tybur (dhcp).

```
echo 'zone "marley.it04.com" {
    type master;
    file "/etc/bind/sites/marley.it04.com";
};
zone "eldia.it04.com" {
    type master;
    file "/etc/bind/sites/eldia.it04.com";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/sites
cp /etc/bind/db.local /etc/bind/sites/marley.it04.com
cp /etc/bind/db.local /etc/bind/sites/eldia.it04.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     marley.it04.com. root.marley.it04.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      marley.it04.com.
@       IN      A       192.235.1.2    ; IP Annie
www     IN      CNAME   marley.it04.com.' > /etc/bind/sites/marley.it04.com



echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     eldia.it04.com. root.eldia.it04.com. (
                              2023111401         ; Serial
                              604800              ; Refresh
                               86400              ; Retry
                             2419200              ; Expire
                              604800 )            ; Negative Cache TTL
;
@       IN      NS      eldia.it04.com.
@       IN      A       192.235.2.2    ; IP Armin
www     IN      CNAME   eldia.it04.com.' > /etc/bind/sites/eldia.it04.com

echo 'options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    // dnssec-validation auto;

    allow-query { any; };
    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service bind9 restart
```

## No. 2 - 5
Client yang melalui bangsa marley mendapatkan range IP dari [prefix IP].1.05 - [prefix IP].1.25 dan [prefix IP].1.50 - [prefix IP].1.100 (2)
Client yang melalui bangsa eldia mendapatkan range IP dari [prefix IP].2.09 - [prefix IP].2.27 dan [prefix IP].2 .81 - [prefix IP].2.243 (3)
Client mendapatkan DNS dari keluarga Fritz dan dapat terhubung dengan internet melalui DNS tersebut (4)
Dikarenakan keluarga Tybur tidak menyukai kaum eldia, maka mereka hanya meminjamkan ip address ke kaum eldia selama 6 menit. Namun untuk kaum marley, keluarga Tybur meminjamkan ip address selama 30 menit. Waktu maksimal dialokasikan untuk peminjaman alamat IP selama 87 menit. (5)

### Paradis.sh
```
echo '# Defaults for isc-dhcp-relay initscript
# sourced by /etc/init.d/isc-dhcp-relay
# installed at /etc/default/isc-dhcp-relay by the maintainer scripts

#
# This is a POSIX shell fragment
#

# What servers should the DHCP relay forward requests to?
SERVERS="192.235.4.2"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth1 eth2 eth3 eth4"

# Additional options that are passed to the DHCP relay daemon?
OPTIONS=""' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart

echo '
net.ipv4.ip_forward=1
' >> /etc/sysctl.conf

echo "REMINDER 2: Setelah itu, restart semua client."
```
### Tybur.sh
```
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
```

### Bentuk Hasil No 2-5

![image](https://github.com/user-attachments/assets/a72d38a1-e286-4dfc-9bba-f6f8ab5e60f5)

![image](https://github.com/user-attachments/assets/525c7dac-7b91-42ea-8295-f69c854017b1)


## No.6
Armin berinisiasi untuk memerintahkan setiap worker PHP untuk melakukan konfigurasi virtual host untuk website berikut https://intip.in/BangsaEldia dengan menggunakan php 7.3 
```
wget -O '/var/www/eldia.it04.com' 'https://drive.google.com/uc?export=download&id=1ufulgiWyTbOXQcow11JkXG7safgLq1y-'
unzip -o /var/www/eldia.it04.com -d /var/www/
rm /var/www/eldia.it04.com
mv /var/www/modul-3 /var/www/eldia.it04.com
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/eldia.it04.com
ln -s /etc/nginx/sites-available/eldia.it04.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
     listen 80;
     server_name _;

     root /var/www/eldia.it04.com/;
     index index.php index.html index.htm;

     location / {
         try_files $uri $uri/ /index.php?$query_string;
     }

     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/run/php/php7.3-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
     }
 }' > /etc/nginx/sites-available/eldia.it04.com
service php7.3-fpm restart
service nginx restart
```

### Bentuk Hasil No 6

![image](https://github.com/user-attachments/assets/1bff8f2e-a033-487d-9a33-f4a51c12cd0a)

![image](https://github.com/user-attachments/assets/5bf301de-7403-41ec-a18f-d5b2767468a6)

![image](https://github.com/user-attachments/assets/6a4f6ac2-078f-4a1e-81b3-68860c117a80)


## No.7
Dikarenakan Armin sudah mendapatkan kekuatan titan colossal, maka bantulah kaum eldia menggunakan colossal agar dapat bekerja sama dengan baik. Kemudian lakukan testing dengan 6000 request dan 200 request/second.
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     marley.it04.com. root.marley.it04.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      marley.it04.com.
@       IN      A       192.235.3.4    ; IP Colossal
www     IN      CNAME   marley.it04.com.' > /etc/bind/sites/marley.it04.com



echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     eldia.it04.com. root.eldia.it04.com. (
                              2023111401         ; Serial
                              604800              ; Refresh
                               86400              ; Retry
                             2419200              ; Expire
                              604800 )            ; Negative Cache TTL
;
@       IN      NS      eldia.it04.com.
@       IN      A       192.235.3.4    ; IP Colossal
www     IN      CNAME   eldia.it04.com.' > /etc/bind/sites/eldia.it04.com

service bind9 restart
```

### Bentuk Hasil No 7

![image](https://github.com/user-attachments/assets/3c40066c-884e-4db3-b142-3b982e56c385)

## No.8
Karena Erwin meminta “laporan kerja Armin”, maka dari itu buatlah analisis hasil testing dengan 1000 request dan 75 request/second untuk masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
- Nama Algoritma Load Balancer
- Report hasil testing pada Apache Benchmark
- Grafik request per second untuk masing masing algoritma. 
- Analisis
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo ' upstream worker {
        #least_conn;
        #ip_hash;
    server 192.235.2.2;
    server 192.235.2.3;
    server 192.235.2.4;
}

server {
    listen 80;
    server_name eldia.it04.com www.eldia.it04.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://worker;
    }
} ' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```
### Bentuk Hasil No 8

#### Round Robin

![image](https://github.com/user-attachments/assets/64f9b67b-675d-4e5f-8a23-583200dda391)


#### IP Hash

![image](https://github.com/user-attachments/assets/f806b6eb-78cd-45b1-8df6-9a909d13a48a)


#### Least Connection

![image](https://github.com/user-attachments/assets/d515d6d8-0976-46ba-8531-e97d5957f614)

## No.9 
Dengan menggunakan algoritma Least-Connection, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 1000 request dengan 10 request/second, kemudian tambahkan grafiknya pada “laporan kerja Armin”.
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo ' upstream worker {
        least_conn;
    server 192.235.2.2;
    server 192.235.2.3;
    server 192.235.2.4;
}

server {
    listen 80;
    server_name eldia.it04.com www.eldia.it04.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://worker;
    }
} ' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```

### Bentuk Hasil No 9

#### 3 Worker

![image](https://github.com/user-attachments/assets/26d8ef94-8142-4551-867f-8c6c6e1e6fb1)


#### 2 Worker

![image](https://github.com/user-attachments/assets/ab2ddbeb-6360-49d3-9bdf-4e1088d778f3)


#### 1 Worker
![image](https://github.com/user-attachments/assets/675effdf-d249-4156-9bc7-6264245653f4)

## No.10
Selanjutnya coba tambahkan keamanan dengan konfigurasi autentikasi di Colossal dengan dengan kombinasi username: “arminannie” dan password: “jrkmyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/supersecret/ 
```
echo 'REMINDER : masukkan password jrk04'
mkdir /etc/nginx/supersecret/
htpasswd -c -b /etc/nginx/supersecret/.htpasswd arminannie jrkmit04

echo '
upstream worker_round_robin {
    server 192.235.2.2;
    server 192.235.2.3;
    server 192.235.2.4;
}

server {
    listen 80;
    server_name eldia.it04.com www.eldia.it04.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    location / {
        proxy_pass http://worker_round_robin;
    }

    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
}' > /etc/nginx/sites-available/lb_php
service nginx restart
```

### Bentuk Hasil No 10

![image](https://github.com/user-attachments/assets/5c0636e8-0b20-4d14-859a-1e2ae45e076b)

![image](https://github.com/user-attachments/assets/50db2e99-42e5-4dfc-b948-a61070211d82)

![image](https://github.com/user-attachments/assets/f5491736-0a60-44c0-a5f6-219a35608e5a)


## No.11
Lalu buat untuk setiap request yang mengandung /titan akan di proxy passing menuju halaman https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki
```
echo '
upstream worker-aot {
    server 192.235.2.2;
    server 192.235.2.3;
    server 192.235.2.4;
}

server {
    listen 80;
    server_name eldia.it04.com www.eldia.it04.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        proxy_pass http://worker-aot;
    }

    location /aot {
        proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki/;
    }

    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
}' > /etc/nginx/sites-available/lb_php


rm -f /etc/nginx/sites-enabled/lb_php
ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

service nginx restart
```

### Bentuk Hasil No 11

![image](https://github.com/user-attachments/assets/c9cde661-b2bc-4c9c-8964-dd6686d16080)

## No.12
Selanjutnya Colossal ini hanya boleh diakses oleh client dengan IP [Prefix IP].1.77, [Prefix IP].1.88, [Prefix IP].2.144, dan [Prefix IP].2.156
### Colossal.sh
```
echo '
upstream worker-aot {
    server 192.235.2.2;
    server 192.235.2.3;
    server 192.235.2.4;
}

server {
    listen 80;
    server_name eldia.it04.com www.eldia.it04.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        allow 192.235.1.77;
        allow 192.235.1.88;
        allow 192.235.2.144;
        allow 192.235.2.156;
        deny all;
        proxy_pass http://worker-aot;
    }

    location /aot {
        proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki/;
    }

    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
}' > /etc/nginx/sites-available/lb_php


rm -f /etc/nginx/sites-enabled/lb_php
ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

service nginx restart
```
### Tybur.sh
```
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

host Erwin {
hardware ethernet 52:fe:1e:bc:f7:c6;
fixed-address 192.235.2.156;
}


' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```

### Bentuk Hasil No 12

![image](https://github.com/user-attachments/assets/038449d8-efec-4074-a20e-17353f985075)

![image](https://github.com/user-attachments/assets/68026447-02da-40af-aa84-16e76fda33e3)



