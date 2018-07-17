# ahoy-docker

A little exercise to better understand Docker by Dockerizing a basic Sinatra app.

# Usage

```
git clone git@github.com:SaphMB/ahoy-docker.git
cd ahoy-docker
docker build -t ahoy-sinatra .
docker run ahoy-sinatra

# visit localhost:9292
```

# Tests

```
cd app
bundle install
rspec
```

# Technologies
* Ruby
* Sinatra
* Rspec
* Docker