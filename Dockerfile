#deve dependencies
FROM  node:19.2-alpine3.16 as deps
WORKDIR /app
COPY  package.json ./
RUN npm install

#builder && testa 
FROM  node:19.2-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY  . .
RUN npm run test

# production dependencies
FROM  node:19.2-alpine3.16 as builder
WORKDIR /app
COPY  package.json ./
RUN npm run install --prod

# runner ejecutar la app
FROM  node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY  app.js ./
COPY  tasks/ ./tasks

CMD ["node", "app.js"]