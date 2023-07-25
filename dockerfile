FROM node:18.16.0 as node
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run b

#simplificado --package copy.json
#FROM nginx:alpine
FROM nginx:alpine3.17-slim
RUN apk update && apk upgrade openssl

COPY --from=node /app/dist/skote /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 4001
