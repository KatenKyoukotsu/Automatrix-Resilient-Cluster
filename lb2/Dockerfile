FROM debian:latest

RUN apt-get updae && apt-get install nginx -y

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 
