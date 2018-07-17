FROM ruby:2.4.4-alpine

RUN mkdir app

ADD app/Gemfile /app/

RUN apk --update add --virtual build-dependencies ruby-dev build-base \
  && gem install bundler --no-ri --no-rdoc \
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