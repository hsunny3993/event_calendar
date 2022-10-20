FROM ruby:3.0.1

ENV RAILS_ROOT /var/www/event-calendar
RUN mkdir -p $RAILS_ROOT
RUN mkdir -p $RAILS_ROOT/tmp/sockets
RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production'
ENV RAILS_SERVE_STATIC_FILES=true

ENV DB_HOST='18.196.200.135'
ENV SOCKET_NAME='eventclalendar'
ENV PIDFILE=/var/www/envent-calendar/tmp/pids/puma.pid

COPY . .

RUN mkdir /root/.ssh
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
ADD docker/deu1/id_ed25519 /root/.ssh/id_ed25519
RUN chmod 600 /root/.ssh/id_ed25519

RUN gem install bundler
RUN bundle config set --local without 'development test'
RUN bundle install

RUN chmod -R 775 bin
RUN EDITOR="mate --wait" bundle exec rails credentials:edit
RUN bundle exec rake assets:precompile
RUN bundle exec rake db:migrate

CMD ["bundle", "exec", "puma -C /var/www/mcrx/config/puma.rb"]