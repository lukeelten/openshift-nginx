FROM nginx:stable-alpine

USER root

RUN apk add --no-cache curl bash

#add nginx config





RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx && \
    chgrp -R root /var/cache/nginx && \
    chmod -R go+w /usr/share/nginx/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]