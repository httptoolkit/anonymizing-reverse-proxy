FROM caddy:2.9.1-alpine

COPY ./Caddyfile /etc/caddy/Caddyfile

RUN caddy validate --config /etc/caddy/Caddyfile