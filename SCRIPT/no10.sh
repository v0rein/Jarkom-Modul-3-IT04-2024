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