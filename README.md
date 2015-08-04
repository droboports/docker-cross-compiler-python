# docker-cross-compiler

## Pull the container

This container is available from [Docker Hub](https://registry.hub.docker.com/u/droboports/python-compiler/).

```
docker pull droboports/python-compiler
```

## Build the container

```
docker build --tag="droboports/python-compiler" https://github.com/droboports/docker-cross-compiler-python.git
```

## Start a temporary interactive container

```
docker run --rm -t -i droboports/python-compiler
```

## Build `samba` using a temporary interactive container

From the container prompt:
```
cd ~/build
git clone https://github.com/droboports/samba.git
cd samba
./build.sh
ls -la *.tgz
```

## Using the container's build command

This container provides a special `build` command to build projects in git repositories.

The syntax is `build project-name` or `build url.git`, where `project-name` is the name of the DroboPorts project, and `url.git` is the URL of a git repository.

For DroboPorts projects, the name is the last component of the GitHub URL. For example, to build the project hosted by the repository https://github.com/droboports/samba, use the name `samba`.

To use the build command, first create a folder to host the resulting packages:
```
mkdir -p ~/dist
chmod a+rw ~/dist
```

Then start the container using the special `build` syntax:
```
docker run --rm --volume ~/dist:/dist droboports/python-compiler build project-name
```

Once the build is done, `~/dist` will contain `project-name.tgz`. If no `tgz` or `egg` was produced, the docker container will start a bash shell.
