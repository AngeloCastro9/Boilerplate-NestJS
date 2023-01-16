FROM node:19-alpine3.16 AS development

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install glob rimraf

RUN npm install --only=development

RUN npx prisma generate

COPY . .

RUN npm run build

FROM node:19-alpine3.16 as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

RUN npx prisma generate

COPY . .

COPY --from=development /usr/src/app/dist ./dist

CMD ["node", "dist/main"]