FROM openjdk:15-alpine
LABEL maintainer="docker@dfriedmann.de"

ARG PAPER_DOWN_URL=https://papermc.io/api/v2/projects/paper/versions/1.16.4/builds/400/downloads/paper-1.16.4-400.jar

ENV EULA false
ENV MIN_MEMORY 1G
ENV MAX_MEMORY 2G

RUN apk add --no-cache curl && \
    addgroup -S mc -g 1001 && \
    adduser -S mc -u 1001 -G mc && \
    mkdir /minecraft && \
    mkdir /minecraft/data && \
    mkdir /minecraft/conf && \
    curl $PAPER_DOWN_URL -s -o /minecraft/paper.jar && \
    chown -R 1001:1001 /minecraft 

WORKDIR /minecraft
COPY --chown=mc:mc ./scripts/entrypoint.sh .

USER mc
EXPOSE 25565

ENTRYPOINT ["sh", "entrypoint.sh"]