FROM nginx:alpine
COPY ./source/index-red.html /usr/share/nginx/html/index.html
