FROM alpine:3.10

ADD Trojan.sh /Trojan.sh

RUN chmod 0755 /Trojan.sh

CMD /Trojan.sh
