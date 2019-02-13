FROM node:alpine as builderagain
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builderagain /app/build /usr/share/nginx/html