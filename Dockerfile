FROM ruby:2.7.0

ENV TZ Asia/Tokyo
RUN mkdir /app

ENV APP_ROOT /app
WORKDIR $APP_ROOT

RUN apt-get update
RUN apt-get install -y nodejs graphviz vim --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn 

ENV YARN_VERSION 1.21.1

RUN yarn add ts-loader typescript @types/react @types/react-dom && \
node_modules/typescript/bin/tsc --init

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

# bundle install
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler
RUN bundle config --global build.nokogiri --use-system-libraries
RUN bundle config --global jobs 4
RUN bundle install

ADD . $APP_ROOT

EXPOSE  3000

COPY /.fonts /usr/share/fonts
RUN fc-cache -fv