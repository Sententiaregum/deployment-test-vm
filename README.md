# Deployment Testing VM for Sententiaregum

## What is it?

This repository contains a testing VM which will be used in order to test the deployment of [Sententiaregum](https://github.com/Sententiaregum/Sententiaregum).

The `Vagrantfile` contains a basic setup and the `setup.sh` can be used as example that shows what's needed for the server.

## Required software

The provisioner installs the following software onto a basebox with Ubuntu Xenial LTS (`bento/ubuntu-16.04`):

- PHP 7 (including PDO, Mbstring, XML and Zip (required by composer)
- The latest composer version
- A MySQL database
- Redis
- NodeJS 6 + NPM
- Webpack, Less and `node-gyp`
- Builds the `/var/www/sententiaregum` directory and makes it accessible for the `vagrant` user.
