FROM node:10-alpine
ENV LANG=C.UTF-8 TZ=Asia/Tokyo

WORKDIR /app

COPY ./nuxt/package*.json ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache make gcc g++ python3 && \
    npm install

ENV HOST 0.0.0.0
EXPOSE 8080

CMD npm run dev
