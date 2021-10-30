# Example Sinatra-Puma Docker based image

## Docker login

```
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

## Build

```
docker build . -t ghcr.io/lmancilla/sinatra-puma-example
```

## Run

```
docker run -v ${PWD}:/usr/src/app -p 3000:3000 --rm ghcr.io/lmancilla/sinatra-puma-example bundle exec puma -C config/puma.rb
```
