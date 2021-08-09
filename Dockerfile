FROM node:14-alpine3.14 as build

WORKDIR /usr/local/app

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build

FROM nginx:alpine

COPY --from=build /usr/local/app/dist/book-store /usr/share/nginx/html

EXPOSE 80
