#################
# Bike Database #
#################
# Password is password for staff@freeridepgh.org & volunteer@freeridepgh.org

FROM bikebike/bikebike:16.04
MAINTAINER Jonathan Rosenbaum <gnuser@gmail.com>

RUN git clone https://github.com/Loos/bike-database.git 
RUN gem install bundler
RUN apt-get update && apt-get -y install g++ libfcgi-dev libsqlite3-dev libpq-dev nodejs 
COPY Gemfile /bike-database/ 
RUN bundle install --gemfile=/bike-database/Gemfile
COPY database.yml /bike-database/config/
RUN cd /bike-database; bundle exec rake db:create db:migrate 

# setup to use sqlite3
COPY  bike-database.conf /etc/supervisor/conf.d/

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

# docker run -d -p 3000:3000 --name="bike-database" bikebike/bike-database
