#!/bin/bash
log_file=/tmp/expense.log
color="\e[33m"
echo -e "${color} Installing ngninx \e[0m"
dnf install nginx -y &>>$log_file
echo -e "${color} Enabling  ngninx \e[0m"
systemctl enable nginx &>>/tmp/expense.log
echo -e "${color} Starting ngninx \e[0m"
systemctl start nginx &>>$log_file
cp expense.conf /etc/nginx/default.d/expense.conf
rm -rf /usr/share/nginx/html/*

echo -e "${color} Download frontend application code \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>$log_file
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>$log_file
echo -e "${color} Restrting Nginx ngninx \e[0m"
systemctl restart  nginx &>>$log_file