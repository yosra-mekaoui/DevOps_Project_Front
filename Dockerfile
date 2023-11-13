FROM node:14.21.3-alpine as node
WORKDIR /app
COPY . .
RUN npm cache verify
RUN npm install
RUN npm run build --prod



FROM nginx:alpine
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 80