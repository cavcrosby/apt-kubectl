# apt-kubectl

This is a container image that contains the APT data sources/repositories for
versions of
[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management)
that are not [End of Life (EOL)](https://kubernetes.io/releases/).

## Supported tags and respective `Dockerfile` links

- [`latest`](https://github.com/cavcrosby/apt-kubectl/blob/main/Dockerfile)

## How to use this image

```shell
docker run --interactive --tty "cavcrosby/apt-kubectl:latest"
```

### To download the latest minor version of kubectl

```shell
docker run --volume "${PWD}:/home/apt" "cavcrosby/apt-kubectl:latest" "apt-get" "download" "kubectl=1.*"
```

## License

See LICENSE.
