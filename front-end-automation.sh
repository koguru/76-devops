#!/bin/bash
echo -e "\e[36m Installing ngninx \e[0m"
dnf install nginx -y &>>/tmp/expense.log
echo -e "\e[36m Enabling  ngninx \e[0m"
systemctl enable nginx &>>/tmp/expense.log
echo -e "\e[36m Starting ngninx \e[0m"
systemctl start nginx &>>/tmp/expense.log
cp expense.conf /etc/nginx/default.d/expense.conf
rm -rf /usr/share/nginx/html/*

echo -e "\e[36m Download frontend application code \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo -e "\e[36m Restrting Nginx ngninx \e[0m"
systemctl restart nginx &>>/tmp/expense.log