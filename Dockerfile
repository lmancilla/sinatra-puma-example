FROM ruby:2.7.2-slim-buster

LABEL org.opencontainers.image.source https://github.com/lmancilla/sinatra-puma-example

# Install Dependencies
RUN apt-get update -qq \
      && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
        build-essential \
        gnupg2 \
        curl

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler:2.0.2

# Change permissions for GEM_HOME
RUN chmod -R 777 $GEM_HOME

# Add docker user
RUN adduser --disabled-password --gecos "" docker && adduser docker staff

# Bundler install gems
WORKDIR /tmp
COPY Gemfile Gemfile.lock /tmp/
RUN bundle install -j 2

# Change user and set workdir
USER docker
WORKDIR /usr/src/app

# Copy app source into container
COPY --chown=docker:docker . /usr/src/app/

EXPOSE 3000
