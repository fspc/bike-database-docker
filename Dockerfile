#################
# Bike Database #
#################
# Password is password for 

FROM ruby:2.3.1 
MAINTAINER Jonathan Rosenbaum <gnuser@gmail.com>

WORKDIR /app
RUN git clone https://github.com/fspc/bike-database.git .
#RUN apt-get update && apt-get -y install g++ libfcgi-dev libsqlite3-dev libpq-dev nodejs 

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get -y install  libsqlite3-0 nodejs

COPY Gemfile /app 
COPY seeds.rb /app/db
RUN env NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install --gemfile=/app/Gemfile 
COPY database.yml /app/config/
RUN bundle exec rake db:create db:migrate db:setup


#CMD rails server -b 0.0.0.0 -p 3000
CMD rails s



