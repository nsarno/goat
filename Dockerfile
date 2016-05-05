FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /goat
WORKDIR /goat

ADD Gemfile /goat/Gemfile
ADD Gemfile.lock /goat/Gemfile.lock
RUN bundle install

ADD . /goat
