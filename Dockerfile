FROM ruby:2.7.0

RUN apt-get update -qq && \
apt-get install -y \
nodejs \
build-essential

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

ENV YARN_VERSION 1.21.1

RUN yarn add ts-loader typescript @types/react @types/react-dom && \
node_modules/typescript/bin/tsc --init

RUN mkdir /app
WORKDIR /app

ADD Gemfile* /app/

# bundle install
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler
RUN bundle config --global build.nokogiri --use-system-libraries
RUN bundle config --global jobs 4
RUN bundle install

ADD . /app

WORKDIR /app

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
