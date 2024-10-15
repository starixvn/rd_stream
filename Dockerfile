FROM nginx
RUN rm -r /usr/share/nginx/*
COPY output /usr/share/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
