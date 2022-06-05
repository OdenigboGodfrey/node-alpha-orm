FROM node:16.14.2-alpine3.14 as development

WORKDIR /usr/src/app

COPY ./package*.json ./

#RUN apk add --no-cache python3 g++ make

# RUN npm install -g npm@7.24.0

RUN npm install node-pre-gyp -g

RUN npm add sqlite3 -D

# RUN n stable

RUN npm install --unsafe-perm=true --allow-root

# RUN apk add --update python3 make g++ && rm -rf /var/cache/apk/*

RUN npm install

COPY . .

EXPOSE 8001

CMD npm run start
