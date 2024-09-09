# --- Build Stage (keep, just represents a builder)---
FROM alpine:latest AS builder

WORKDIR /src/app
COPY ./src/app/index.html ./src/app/index.html
RUN sed -i 's/Nginx/Protel/g' ./src/app/index.html


# --- Runtime Stage ---
FROM nginx:latest

COPY --from=builder ./index.html /usr/share/nginx/html/index.html

EXPOSE 80
ENTRYPOINT [ "/usr/share/nginx/html/index.html" ]