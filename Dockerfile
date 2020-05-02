FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /gameq_api
WORKDIR /gameq_api
COPY Gemfile /gameq_api/Gemfile
COPY Gemfile.lock /gameq_api/Gemfile.lock
RUN gem install bundler:2.1.4
RUN gem install rake:13.0.1
RUN bundle install
COPY . /gameq_api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
