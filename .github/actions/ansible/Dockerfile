FROM alpine

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apk add ansible gcc python3-dev libc-dev libffi-dev openssl-dev
RUN ansible-galaxy collection install community.general

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]