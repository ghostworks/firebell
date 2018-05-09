FROM ruby:2.5.1
LABEL maintainer="x@rubynerd.net"

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock firebell.gemspec lib/firebell/version.rb ./
RUN bundle install

COPY . .

CMD ['ruby']
