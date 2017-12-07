FROM phusion/passenger-ruby24:0.9.27

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Enable nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Create virtual host
ADD docker/vhost.conf /etc/nginx/sites-enabled/app.conf

# Prepare folders
RUN mkdir /home/app/webapp

# Run Bundle in a cache efficient way
WORKDIR /tmp
COPY app/Gemfile /tmp/
COPY app/Gemfile.lock /tmp/
RUN bundle install