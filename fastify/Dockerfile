FROM node:16

COPY ./server.js /usr/src/app/server.js
COPY ./package.json /usr/src/app/package.json
COPY ./data /usr/src/app/data

WORKDIR /usr/src/app
RUN npm install
CMD node server.js
