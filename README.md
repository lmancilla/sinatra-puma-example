# Example Sinatra-Puma Docker based image

## Docker login

```
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

## Build

```
IMAGE_TAG=1.7
docker build . -t ghcr.io/lmancilla/sinatra-puma-example:${IMAGE_TAG}
docker tag ghcr.io/lmancilla/sinatra-puma-example:${IMAGE_TAG} latest
```

## Run

```
docker run -v ${PWD}:/usr/src/app -p 3000:3000 --rm ghcr.io/lmancilla/sinatra-puma-example:latest bundle exec puma -C config/puma.rb
```
