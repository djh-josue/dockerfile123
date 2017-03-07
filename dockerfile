FROM ubuntu:16.4
ENV UBUNTU_DESING
RUN apt-get update -y
RUN apt-get install openssh-client
EXPOSE 8001
CMD [ "-D", "FOREGROUND" ]