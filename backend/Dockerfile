FROM node:20.0.0-slim

WORKDIR /app

COPY --chown=node:node package*.json ./

RUN npm ci --omit=dev

COPY --chown=node:node . .

USER node

EXPOSE 3000

CMD ["npm", "start"]
