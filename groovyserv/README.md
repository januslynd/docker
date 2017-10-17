# GROOVYSERV

This Docker image executes a `groovyserver` instance and exposes
`groovyclient` in the user's available `$PATH`.To build this image,
once you are in the `rpi-java` directory you have to:

- Execute `./build.sh`

## About Groovyserv

Groovyserv (https://github.com/kobo/groovyserv) makes Groovy execution
faster because it starts up a new JVM and executes new Groovy
executions in that JVM.

## Extra: Geb->Firefox friendly

This image can also be used to access Firefox's `geckodriver` via
`Geb` (gebish.org). Things to keep in mind:

- Geckodriver needs the firewall to allow connections comming from
  same ip (Need to know how to narrow this)
