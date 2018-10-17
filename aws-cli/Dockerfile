FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
ENTRYPOINT ["aws"]