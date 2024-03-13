#syntax=docker/dockerfile:1.4
FROM node:alpine3.14

COPY package.json yarn.lock /
#RUN --mount=type=cache,target=/usr/local/share/.cache/yarn/v6 yarn install

#RUN yarn install
RUN yarn install && yarn cache clean

COPY ./index.js /

EXPOSE 3000

CMD ["node","index.js"]
