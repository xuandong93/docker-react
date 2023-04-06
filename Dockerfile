FROM node:16-alpine as builder

RUN mkdir -p /home/xuandong93/frontend

WORKDIR '/home/xuandong93/frontend'

COPY  ./package.json ./

RUN npm install

COPY  ./ ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /home/xuandong93/frontend/build /usr/share/nginx/html