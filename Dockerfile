FROM ruby:2.7-alpine3.11 AS downloader
ENV CF_CLI_VERSION "6.53.0"
ENV PACKAGES "unzip curl"
RUN apk add --no-cache $PACKAGES && \
 curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin
 
FROM alpine:latest 
ENV PACKAGES "openssl ca-certificates ansible bash tar curl"
COPY --from=downloader /usr/local/bin/cf /usr/local/bin/
RUN apk add --no-cache $PACKAGES && \
 cf install-plugin -f -r CF-Community app-autoscaler-plugin
