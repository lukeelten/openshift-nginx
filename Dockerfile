ARG NGINX_VERSION=stable-alpine

FROM nginx:$NGINX_VERSION
LABEL maintainer="Tobias Derksen <lukeelten@gmail.com>"
LABEL nginx-base=$NGINX_VERSION


USER root


#add nginx config
COPY nginx.conf /etc/nginx/
COPY conf.d/*.conf /etc/nginx/conf.d


RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx && \
    chgrp -R root /var/cache/nginx && \
    chmod -R go+w /usr/share/nginx/ && \
    rm -f /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]