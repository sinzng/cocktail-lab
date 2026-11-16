FROM 192.168.60.135/nginxinc/nginx-unprivileged:1.25.4-alpine-slim

USER 0
RUN echo "intentional build failure" && exit 1
COPY index.html /usr/share/nginx/html/index.html
COPY healthz /usr/share/nginx/html/healthz
RUN chmod 644 /usr/share/nginx/html/index.html /usr/share/nginx/html/healthz

USER 101
EXPOSE 8080
