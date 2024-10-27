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