FROM node:alpine

WORKDIR /usr/app

RUN npm install --global pm2

COPY ./package*.json ./

RUN npm install --production
RUN npm install --save-dev @types/react @types/node

COPY ./ ./

RUN npm run build

EXPOSE 3000

USER node

CMD [ "pm2-runtime", "start", "npm", "--", "start" ]