FROM ruby:3.3.6-alpine

LABEL org.opencontainers.image.source=https://github.com/SaphMB/ahoy-docker

RUN mkdir app

ADD app/Gemfile /app/

RUN apk --update add --virtual build-dependencies ruby-dev build-base \
  && gem install bundler \
  && cd /app \
  && bundle install \
  && apk del build-dependencies
  
ADD app/ahoy.rb /app

ADD app/config.ru /app

RUN chown -R nobody:nogroup /app

USER nobody

EXPOSE 9292

ENV HOME=/app

WORKDIR /app

CMD bundle exec rackup -o 0.0.0.0 -p 9292