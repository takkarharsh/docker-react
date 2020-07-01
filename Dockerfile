FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:alpine
EXPOSE 80
# https://hub.docker.com/_/nginx
COPY --from=0 /app/build /usr/share/nginx/html