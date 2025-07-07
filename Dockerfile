FROM node:24-alpine

WORKDIR /app

COPY docusaurus/. /app/

RUN npm ci

RUN npm run build

EXPOSE 3000
CMD ["npm", "run", "serve", "--", "--host", "0.0.0.0", "--no-open"]