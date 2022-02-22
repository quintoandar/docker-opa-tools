FROM gcr.io/quintohub/opa-sidecar:v1.12.4-redis

ARG KILLGRAVE_VERSION=0.4.1
ARG YQ_VERSION=v4.15.1

ADD https://github.com/friendsofgo/killgrave/releases/download/v$KILLGRAVE_VERSION/killgrave_$KILLGRAVE_VERSION\_linux_x86_64.tar.gz /tmp/killgrave.tar.gz
ADD https://github.com/mikefarah/yq/releases/download/$YQ_VERSION/yq_linux_amd64 /bin/yq

RUN tar xzf /tmp/killgrave.tar.gz -C /bin/ && \
    rm -f /tmp/killgrave.tar.gz && \
    chown root:root /bin/killgrave && \
    chmod +x /bin/yq /bin/opa /bin/killgrave && \
    apk add --no-cache curl aws-cli make
