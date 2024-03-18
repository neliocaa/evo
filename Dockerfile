FROM node:20.7.0-alpine AS builder

LABEL version="1.7.0" description="Api to control whatsapp features through http requests." 
LABEL maintainer="Davidson Gomes" git="https://github.com/DavidsonGomes"
LABEL contact="contato@agenciadgcode.com"

RUN apk update && apk upgrade && \
    apk add --no-cache git tzdata ffmpeg wget curl

WORKDIR /evolution

COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:20.7.0-alpine AS final

WORKDIR /evolution

COPY --from=builder /evolution .

CMD [ "node", "./dist/src/main.js" ]
