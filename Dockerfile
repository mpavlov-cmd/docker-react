FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

# /app/build is all we need in builder container
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html