FROM node:alpine as builder

WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY . .
RUN pwd

CMD ["npm","run","build"]

FROM nginx
#used by AWS elasticbeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html