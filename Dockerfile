FROM alpine:latest

RUN \
  apk add --update \
  ca-certificates \
  bash \
  git \
  openssh \
  python3 \
  python3-dev \
  py3-pip \
  lftp \
  build-base && \
  pip install --upgrade pip && \
  pip install mkdocs && \
  pip install mkdocs-minify-plugin && \
  pip install mkdocs-drawio-exporter && \
  pip install mkdocs-material && \
  pip install mkdocs-ko-fi-button-plugin && \
  pip install mkdocs-windmill && \
  pip install mkdocs-git-revision-date-localized-plugin && \
  pip install mkdocs-windmill-dark && \
  pip install pip install neoteroi-mkdocs && \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

CMD ["sh", "-c", "tail -f /dev/null"]