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
  pipx \
  lftp \
  build-base && \
  pipx install mkdocs && \
  pipx install mkdocs-minify-plugin --include-deps && \
  pipx install mkdocs-drawio-exporter --include-deps && \
  pipx install mkdocs-material --include-deps && \
  pipx install mkdocs-ko-fi-button-plugin --include-deps && \
  pipx install mkdocs-windmill --include-deps && \
  pipx install mkdocs-git-revision-date-localized-plugin --include-deps && \
  pipx install mkdocs-windmill-dark --include-deps && \
  pipx install neoteroi-mkdocs --include-deps && \
  pipx install mkdocs-git-revision-date-localized-plugin --include-deps && \
  pipx install mkdocs-redirects --include-deps && \
  pipx install mkdocs-awesome-pages-plugin --include-deps && \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

CMD ["sh", "-c", "tail -f /dev/null"]