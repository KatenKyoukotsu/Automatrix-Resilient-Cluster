#Using official img 
FROM debian:latest

#Install package
RUN apt-get update && apt-get install nginx -y

#Copy .conf file nginx in container
COPY nginx.conf /etc/nginx/nginx.conf

#Specify port 
EXPOSE 80

#Launch nginx when container starts
CMD ["nginx", "-g", "daemon off;"]


