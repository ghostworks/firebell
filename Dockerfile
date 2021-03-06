FROM ruby:2.5.1
LABEL maintainer="x@rubynerd.net"

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY lib/firebell/version.rb lib/firebell/version.rb
COPY Gemfile Gemfile.lock firebell.gemspec ./
RUN bundle install --verbose

RUN find /usr/local/bundle/bin

COPY . .

CMD ['ruby']
