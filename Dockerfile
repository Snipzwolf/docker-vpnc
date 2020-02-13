FROM ubuntu:bionic

ENV DEBCONF_NONINTERACTIVE_SEEN="true" \
    DEBIAN_FRONTEND="noninteractive"

COPY src/entrypoint.sh /opt/entrypoint.sh
RUN chmod 0555 /opt/entrypoint.sh;

RUN apt-get update; apt-get install -qqy vpnc; apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

ENTRYPOINT ["/opt/entrypoint.sh"]
