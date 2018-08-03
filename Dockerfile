FROM ruby:latest

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

RUN apt-get update && apt-get install -y postgresql-client

COPY Gemfile      $APP_ROOT
COPY Gemfile.lock $APP_ROOT 

RUN bundle install

COPY . $APP_ROOT

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
