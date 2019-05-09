FROM node:8.16.0-alpine

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && cnpm install -g yapi-cli \
    && apk update && apk add --no-cache make python git \
    && npm install ykit -g

WORKDIR /my-yapi

COPY ./oauth2Controller.js /my-yapi/vendors/node_modules/yapi-plugin-gitlab/controller

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
