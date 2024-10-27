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