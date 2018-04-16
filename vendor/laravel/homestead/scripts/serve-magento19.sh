#!/usr/bin/env bash

declare -A params=$6     # Create an associative array
paramsTXT=""
if [ -n "$6" ]; then
   for element in "${!params[@]}"
   do
      paramsTXT="${paramsTXT}
      fastcgi_param ${element} ${params[$element]};"
   done
fi

if [ "$7" = "true" ] && [ "$5" = "7.2" ]
then configureZray="
location /ZendServer {
        try_files \$uri \$uri/ /ZendServer/index.php?\$args;
}
"
else configureZray=""
fi

block="server {
    listen ${3:-80};
    #listen ${4:-443} ssl http2;
    server_name .$1;
    root \"$2\";

    location / {
        index index.html index.php; ## Allow a static html file to be shown first
        try_files \$uri \$uri/ @handler; ## If missing pass the URI to Magento's front handler
        expires 30d; ## Assume all files are cachable
    }

    access_log /var/log/nginx/$1/access.log;
    error_log  /var/log/nginx/$1/error.log;
  
    ## These locations would be hidden by .htaccess normally
    location ^~ /app/                { deny all; }
    location ^~ /includes/           { deny all; }
    location ^~ /lib/                { deny all; }
    location ^~ /media/downloadable/ { deny all; }
    location ^~ /pkginfo/            { deny all; }
    location ^~ /report/config.xml   { deny all; }
    location ^~ /var/                { deny all; }
  
    client_max_body_size 100m;

    location  /. { ## Disable .htaccess and other hidden files
        return 404;
    }
  
    location @handler { ## Magento uses a common front handler
        rewrite / /index.php;
    }
  
    location ~ .php/ { ## Forward paths like /js/index.php/x.js to relevant handler
        rewrite ^(.*.php)/ \$1 last;
    }
  
    location ~ .php$ { ## Execute PHP scripts
        if (!-e \$request_filename) { rewrite / /index.php last; } ## Catch 404s that try_files miss
  
        expires        off; ## Do not cache dynamic content
        fastcgi_pass   unix:/var/run/php/php7.1-fpm.sock;
        #fastcgi_param  HTTPS \$fastcgi_https;
        fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;
        fastcgi_param  MAGE_RUN_CODE default; ## Store code is defined in administration > Configuration > Manage Stores
        fastcgi_param  MAGE_RUN_TYPE store;
        include        fastcgi_params; ## See /etc/nginx/fastcgi_params
    }

    #ssl_certificate     /etc/nginx/ssl/$1.crt;
    #ssl_certificate_key /etc/nginx/ssl/$1.key;
}
"

echo "$block" > "/etc/nginx/sites-available/$1"
ln -fs "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
mkdir /var/log/nginx/$1/
touch /var/log/nginx/$1/access.log
touch /var/log/nginx/$1/error.log
sudo apt-get install php7.1-mcrypt -y


