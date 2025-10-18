
FROM node AS dondhu
WORKDIR /app
# RUN apt-get update && apt install curl -y && curl -s https://deb.nodesource.com/setup_16.x | bash
# RUN apt install nodejs -y
COPY . .
RUN npm install && npm run build

FROM nginx
COPY --from=dondhu /app/build /usr/share/nginx/html
# RUN apt install nginx -y
# RUN cp -R build/* /var/www/html
CMD ["nginx", "-g", "daemon off;"]