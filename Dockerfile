ARG RUBY_VERSION=2.7

# Prepare Ruby Gems
FROM ruby:${RUBY_VERSION}-alpine AS gem

RUN gem install image_size && \
    rm -rf /usr/local/bundle/cache/*.gem

# Server
FROM ruby:${RUBY_VERSION}-alpine

# Add Gems
COPY --from=gem /usr/local/bundle /usr/local/bundle

# Add required packages
RUN apk --update \
    add --no-cache \
    git

# Add Execute User
RUN adduser -D -s /bin/sh ruby

# Add Application
ENV APP_ROOT /opt/image_validation
ENV PATH $APP_ROOT/bin:$PATH
RUN mkdir -p $APP_ROOT
ADD bin $APP_ROOT/bin

# Config Execute Environment
USER ruby
WORKDIR /home/ruby
