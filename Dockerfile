FROM atendai/evolution-api
USER root
RUN apk update && apk add ffmpeg \
    && rm -rf /var/cache/apk/* \
    && npm add ytdl-core -g
USER node
