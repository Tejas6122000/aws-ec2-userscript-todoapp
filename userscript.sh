#!/bin/sh

sudo apt-get update
sudo apt-get install python3 python3-pip nginx gunicorn3 git -y

sudo git clone https://github.com/Tejas6122000/Todo-Flask.git
sudo pip3 install Flask Flask-SQLAlchemy

code="server {
        listen 80;
        listen [::]:80;
        location / {    
                proxy_pass http://localhost:8000;
        }

}"

echo $code>default
sudo cp default /etc/nginx/sites-available/
sudo systemctl reload nginx
cd Todo-Flask/
gunicorn3 app:app
