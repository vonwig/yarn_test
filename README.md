## Building

```sh
# docker:command=build
docker build -t vonwig/yarn-test .
```

## Debugging

```sh
# docker:command=debug
docker run --rm --init -d --name service vonwig/yarn-test
docker debug service
```

## Cleanin cache

```sh
docker builder prune --all
```

## killing any containers still running

```sh
docker container kill service 
```
