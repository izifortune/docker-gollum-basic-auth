FROM ubuntu:16.04

MAINTAINER Takahiro Suzuki <suttang@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y -q build-essential ruby python python-docutils ruby-bundler libicu-dev libreadline-dev libssl-dev zlib1g-dev git-core ruby-dev
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Install gollum
RUN gem install gollum redcarpet github-markdown

COPY auth.rb auth.rb

# Initialize wiki data
RUN mkdir /root/wikidata
RUN git init /root/wikidata

# Expose default gollum port 4567
EXPOSE 4567
ENTRYPOINT ["/usr/local/bin/gollum", "/root/wikidata", "--config", "auth.rb"]
