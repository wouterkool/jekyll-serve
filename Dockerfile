FROM ruby:2.4-alpine

RUN apk add --no-cache build-base gcc bash curl

RUN gem install github-pages

EXPOSE 4000

WORKDIR /site

# crate new site by setting -e JEKYLL_NEW=true
ENV JEKYLL_NEW false

COPY docker-entrypoint.sh /usr/local/bin/

# on every container start we'l'
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]