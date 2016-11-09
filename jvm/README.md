# JVM Docker Image

This image is intended to be used as base image to JVM related
projects. By default it has installed:

- [openjdk](http://openjdk.java.net/) 8 (includes openjfx)
- [sdkman](http://sdkman.io/): To work with JVM related languages (Groovy, Scala, Clojure...)
- [nvm](https://github.com/creationix/nvm): To work with front end development (Node)
- [haskell](https://www.haskell.org/): To work with Haskell

## Building

From `jvm` folder:

```shell
./bin/build.sh
```

## Running

- Put `bin/rocker.sh` in your `$PATH`
- Set execution permissions to `rocker.sh` (chmod +x)
- Go to your favourite JVM project folder
- Execute `rocker.sh exposedport`
- Profit!

Usage example:

```shell
user@machine myprojectfolder>rocker.sh 8080
```

This will open a new tmux session in your container exposing
container's `8080` port. Then, inside the container, you could
execute:

```shell
sdk install groovy
```

And it will install latest `Groovy` distribution, or:

```shell
sdk install scala
```

And it will do the same for `Scala`. For further information check
[sdkman](http://sdkman.io/) documentation.
