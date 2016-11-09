# JVM Docker Image

This image is intended to be used as base image to JVM related
projects.

## Building

From `jvm` folder:

'''shell
./bin/build.sh
'''

## Running

- Put `bin/rocker.sh` in your `$PATH`
- Set execution permissions to `rocker.sh` (chmod +x)
- Go to your favourite JVM project folder
- Execute `rocker.sh hostport:containerport`
- Profit!

Usage example:

'''shell
user@machine/myprojectfolder>rocker.sh 8080:8080
'''

This will open a new tmux session in your container exposing
container's `8080` port.
