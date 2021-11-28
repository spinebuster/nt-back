FROM ruby:3.0.2-alpine
RUN apk add --update \
  build-base bash openssh \
  mysql \
  mysql-client \
  mysql-dev  \
  tzdata \
  && rm -rf /var/cache/apk/*
RUN gem install bundler -v 2.2.31

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries
WORKDIR /nt_back
COPY Gemfile Gemfile.lock /nt_back/
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . /nt_back

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]