#!/usr/bin/env bash

sudo yum update -y
sudo yum install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo aws s3api get-object --key src/index.html --bucket ${s3_external_endpoint} /usr/share/nginx/html/index.html
sudo aws s3api get-object --key src/app.css --bucket ${s3_external_endpoint} /usr/share/nginx/html/app.css
sudo aws s3api get-object --key src/app.js --bucket ${s3_external_endpoint} /usr/share/nginx/html/app.js

