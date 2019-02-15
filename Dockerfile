FROM node:alpine as builder

WORKDIR '/app'

COPY package*.json /app/
RUN npm install
COPY . /app/

CMD ["npm","run","build"]

FROM nginx
#used by AWS elasticbeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html