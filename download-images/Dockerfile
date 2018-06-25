FROM ubuntu:latest

RUN apt update
RUN apt install -y rsync wget git

ADD source_images /source_images
ADD init.sh /init.sh

CMD /init.sh
