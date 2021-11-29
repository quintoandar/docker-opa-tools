FROM alpine:3.12

ARG OPA_VERSION=0.34.1
ARG KILLGRAVE_VERSION=0.4.1
ARG YQ_VERSION=v4.15.1

ADD https://github.com/open-policy-agent/opa/releases/download/v$OPA_VERSION/opa_linux_amd64_static /bin/opa
ADD https://github.com/friendsofgo/killgrave/releases/download/v$KILLGRAVE_VERSION/killgrave_$KILLGRAVE_VERSION\_linux_x86_64.tar.gz /tmp/killgrave.tar.gz
ADD https://github.com/mikefarah/yq/releases/download/$YQ_VERSION/yq_darwin_arm64 /bin/yq

RUN tar xzf /tmp/killgrave.tar.gz -C /bin/ && \
    rm -f /tmp/killgrave.tar.gz && \
    chown root:root /bin/killgrave && \
    chmod +x /bin/yq /bin/opa /bin/killgrave && \
    apk add --no-cache curl aws-cli make
