#FROM set the base image for the container, I'm using debian:bullseye because is more stable than apilne
FROM debian:bullseye

#RUN run a command inside the container while building
#the ppackage manager for debian is apt and we use this to install nginx
RUN apt update && apt upgrade && apt install nginx -y

ENTRYPOINT [ "curl parrot.live" ]