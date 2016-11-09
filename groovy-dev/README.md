# Groovy development Docker Image

This image tries to speed up configuring a development enviroment to
contribute to `groovy-core`:

- [openjdk](http://openjdk.java.net/) 8 (includes openjfx)
- [sdkman](http://sdkman.io/): To work with JVM related languages (Groovy, Scala, Clojure...)
- [intellij](https://www.jetbrains.com/idea/): As default IDE

## Building

Go to `groovy-dev` folder and execute:

```shell
./bin/build.sh
```

## Contributing guideline

After building image `mgg/groovy-dev` then execute the `run.sh` script
pointing to the local copy of the cloned
[Groovy](https://github.com/apache/groovy) repository:

```shell
./bin/run.sh /path/to/cloned/groovy-core
```

Once the container has started you should follow these steps:

- Go to workspace folder: `cd ws`
- Configure `groovy-core` repository to be used inside Intellij: `./gradlew idea`
- Then open `groovy-core` within Intellij executing `groovidea`

That will open `groovy-core` in your Intellij instance using
`openjdk-8`.
