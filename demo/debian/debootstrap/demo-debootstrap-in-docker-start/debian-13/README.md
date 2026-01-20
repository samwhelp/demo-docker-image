

# debian / demo-debootstrap-in-docker-start




## Usage

### help

run

``` sh
make help
```

show

```
Usage:
	$ make [action]

Example:
	$ make
	$ make help

	$ make master-build

```




## Steps

## Steps / Build

> run to build rootfs-archive in docker

``` sh
make master-build
```

> check port dir

``` sh
ls -1 port
```




## Steps / to Docker Image

> import ./port/rootfs.tar.gz to new docker-image

``` sh
./to-docker-image.sh
```

> run new docker-image

``` sh
./test-docker-image.sh
```
