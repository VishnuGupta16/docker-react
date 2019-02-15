FROM node:alpine as builder

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN node -v
RUN ls

CMD ["npm","run","build"]

FROM nginx 
RUN ls /usr/share/nginx/html
RUN pwd
#used by AWS elasticbeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html