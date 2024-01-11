FROM alpine:3.18.3

ENV MKDOCS_VERSION=1.5.2 \
    DOCS_DIRECTORY='/mkdocs' \
    LIVE_RELOAD_SUPPORT='false' \
    ADD_MODULES='false' \
    FAST_MODE='false' \
    PYTHONUNBUFFERED=1 \
    GIT_REPO='false' \
    GIT_BRANCH='master' \
    AUTO_UPDATE='false' \
    UPDATE_INTERVAL=15

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
    pip install mkdocs==${MKDOCS_VERSION} && \
    pip install mkdocs-minify-plugin && \
    pip install mkdocs-drawio-exporter && \
    pip install mkdocs-material && \
    pip install mkdocs-ko-fi-button-plugin && \
    pip install mkdocs-windmill-dark && \
    pip install neoteroi-mkdocs && \
    pip install mkdocs-git-revision-date-localized-plugin && \
    pip install mkdocs-redirects && \
    pip install mkdocs-awesome-pages-plugin && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

CMD ["sh", "-c", "tail -f /dev/null"]