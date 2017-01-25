# Ansible docker image

Docker image to
use [Ansible](https://www.ansible.com/)
inside [Tmate](https://tmate.io/)

## Building

From `ansible` folder:

```shell
./bin/build.sh
```

## Install

From `ansible` folder:

```shell
./bin/install.sh
```

## Run

Once you've installed the command, from a directory where you have the
playbooks execute:

```shell
docker-ansible
```

And then you will find your playbooks inside `/home/dev/ws`.
