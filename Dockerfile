FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /antenna
WORKDIR /antenna
ADD Gemfile /antenna/Gemfile
ADD Gemfile.lock /antenna/Gemfile.lock
RUN bundle install
ADD . /antenna
RUN env RAILS_ENV=production bundle exec rake assets:precompile
EXPOSE 8080
CMD ["bundle", "exec", "rails", "s"]
