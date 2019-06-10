FROM jleoshao/imagemn

ENV VERSION 0.1

COPY entrypoint.sh /usr/local/bin/imagemn.sh

RUN chmod +x /usr/local/bin/imagemn.sh

ENTRYPOINT ["/usr/local/bin/imagemn.sh"]
