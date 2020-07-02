FROM node:14-alpine

WORKDIR /code

ADD package.json package.json

# E' in arrivo da un segreto di jenkins (my-config)
ADD secret.txt secret.txt

RUN npm i --production

ADD index.js index.js

