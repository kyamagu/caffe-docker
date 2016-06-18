# Caffe docker

Docker files for [Caffe](https://github.com/BVLC/caffe) and [Jupyter](http://jupyter.org/) environment, suitable for quick Caffe deployment using [docker](https://www.docker.com). The base dockerfile is taken from the official [Caffe](https://github.com/BVLC/caffe) repository.

The docker image is also hosted on [Docker hub](https://hub.docker.com/r/kyamagu/caffe/).

## Getting started

_Linux/Mac_

The docker image automatically launches jupyter notebook at port 8888. Create a `notebooks` directory (`mkdir notebooks`) in the current directory and start the container.

```bash
docker run -it \
  -p 8888:8888 \
  -e LOCAL_USER_ID=`id -u` \
  -v `pwd`/notebooks:/home/user \
  kyamagu/caffe
```

Open `localhost:8888` in the web browser and start your coffee brew.

The `-it` (interactive tty) flag may be changed to `-d` (daemon) so that the jupyter notebook runs in the background. The `LOCAL_USER_ID` environment variable sets up the user id in the container so that any file created in the container has correct user permission in the host volume (`notebooks`), which is mapped to `/home/user` inside the container.

_Windows_

In Windows or Mac, we do not need to specify `LOCAL_USER_ID` in the command line. Specify `notebooks` directory in the `-v` option and start. Replace `%USERNAME%` with your account name.

```bash
docker run -it -p 8888:8888 -v /c/Users/%USERNAME%/notebooks:/home/user kyamagu/caffe
```

Any notebook created inside jupyter will be saved in `c:\Users\%USERNAME%\notebooks`.

## How to manage docker containers

To stop the running container,

```bash
docker ps
```

Check the container ID, and use `docker stop` command.

```bash
docker stop <Container-ID>
```

To restart the stopped container,

```bash
docker restart <Container-ID>
```

To list all the existing containers,

```bash
docker ps -a
```

To remove the container,

```bash
docker rm <Container-ID>
```

To remove all the containers,

```bash
docker rm `docker ps --no-trunc -aq`
```

See [Docker documentation](https://docs.docker.com/) for additional information. Windows and Mac users might like [Kitematic](https://kitematic.com/) to manage containers.

## How to build

Use `Makefile` to build docker images.

```bash
make -C docker
```

Or, manually build docker files.

```bash
docker build -t caffe:cpu docker/cpu
docker build -t caffe:gosu docker/gosu
docker build -t caffe:jupyter docker/jupyter
```
