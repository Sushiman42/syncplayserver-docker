FROM python:3.7-alpine3.13
#temp change for upstream issue with libressl

LABEL maintainer="sushiman42"

#Bash is in here cause POSIX shell was throwing errors and I'm lazy
RUN  apk add --no-cache --update --progress \
        bash \ 
        musl \
        build-base \
        bash \
        git \
        libressl-dev \
        musl-dev \
        rust \
        cargo \
        libffi-dev

RUN pip install -q --no-cache-dir --upgrade pip && \
    pip install \
        twisted \
        certifi \
        pyopenssl \
        service_identity \
        idna \
        cryptography

RUN mkdir /app/syncplay -p
#Last working version was 1.6.6
RUN git clone https://github.com/Syncplay/syncplay -b v1.6.8  /app/syncplay

COPY ./entrypoint.sh /entrypoint.sh

# Run as non-root user                                                                                                  
RUN addgroup -g 800 -S syncplay && \
    adduser -u 800 -S syncplay -G syncplay && \
    chown -R syncplay:syncplay /app/syncplay

USER syncplay

WORKDIR /app/syncplay
ENTRYPOINT ["/entrypoint.sh"]
