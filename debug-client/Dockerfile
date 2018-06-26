FROM ubuntu:latest

RUN apt update
RUN apt install -y net-tools isc-dhcp-client elinks iputils-ping traceroute telnet wget links2 firefox xauth

ADD init.sh /init.sh
CMD /init.sh
