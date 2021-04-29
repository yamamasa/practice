FROM nginx:perl

RUN rm -f /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/conf.d/default.conf
ADD ./docker/proxy/nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
