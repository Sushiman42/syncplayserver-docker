FROM python:3.7-alpine

RUN  apk add --no-cache --update --progress \
        musl \
        build-base \
        bash \
        git \
        libressl-dev \
        musl-dev \
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
RUN git clone https://github.com/Syncplay/syncplay /app/syncplay

COPY ./entrypoint.sh /entrypoint.sh

# Run as non-root user                                                                                                  
RUN addgroup -g 800 -S syncplay && \
    adduser -u 800 -S syncplay -G syncplay && \
    chown -R syncplay:syncplay /app/syncplay

USER syncplay

WORKDIR /app/syncplay
ENTRYPOINT ["/entrypoint.sh"]
