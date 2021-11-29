FROM alpine:3.12

ARG OPA_VERSION=0.34.1
ARG KILLGRAVE_VERSION=0.4.1

ADD https://github.com/open-policy-agent/opa/releases/download/v$OPA_VERSION/opa_linux_amd64_static /bin/opa
ADD https://github.com/friendsofgo/killgrave/releases/download/v$KILLGRAVE_VERSION/killgrave_$KILLGRAVE_VERSION\_linux_x86_64.tar.gz /tmp/killgrave.tar.gz

RUN tar xzf /tmp/killgrave.tar.gz -C /bin/ && \
    rm -f /tmp/killgrave.tar.gz && \
    chown root:root /bin/killgrave && \
    chmod +x /bin/opa /bin/killgrave && \
    apk add --no-cache curl aws-cli make yq
