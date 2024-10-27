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