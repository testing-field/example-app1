FROM node:14-alpine

WORKDIR /code

ADD package.json package.json
RUN npm i --production

ADD index.js index.js

