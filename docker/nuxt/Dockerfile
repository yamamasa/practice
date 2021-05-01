FROM node:16-alpine

WORKDIR /app

RUN apk update && \
    apk add git && \
    npm install -g npm && \
    npm install -g vue-cli

ENV HOST 0.0.0.0
EXPOSE 8080

CMD npm run dev
