FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client && gem update bundler

RUN mkdir /app
WORKDIR /app
COPY ./rails/Gemfile /app/Gemfile
COPY ./rails/Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY ./rails /app

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY ./docker/rails/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# メインプロセスの起動
CMD ["rails", "server", "-b", "0.0.0.0"]
