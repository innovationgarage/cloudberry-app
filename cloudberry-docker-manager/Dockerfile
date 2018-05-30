FROM ubuntu:latest

RUN echo version 1 cache punch

RUN apt update

RUN apt install -y git python3 python3-pip docker.io

RUN git clone https://github.com/innovationgarage/cloudberry-docker-manager.git
RUN cd cloudberry-docker-manager; python3 setup.py install

ADD server.sh /server.sh

CMD /server.sh

EXPOSE 80
