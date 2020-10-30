FROM ruby:2.6.5

#パッケージの取得
RUN apt-get update && apt-get install -y --no-install-recommends\
  nodejs  \
  mariadb-client  \
  build-essential  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /myproject
COPY Gemfile /myproject/Gemfile
COPY Gemfile.lock /myproject/Gemfile.lock
RUN gem install bundler
RUN bundle install
#既存railsプロジェクトをコンテナ内にコピー
COPY . /myproject

# FROM ruby:2.6.5
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn
# RUN mkdir /app
# WORKDIR /app
# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
# RUN gem install bundler
# RUN bundle install
# COPY . /app