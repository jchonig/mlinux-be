# Containerized build environment for Multitech mLinux

[MultiTech](https://www.multitech.com/) [mLinux](http://www.multitech.net/developer/software/mlinux/about-mlinux/) is a [Yocto Project](https://www.yoctoproject.org/) based Linux for the MultiTech Conduit family of products.

*THIS IS CURRENTLY A WORK IN PROGRESS*

## mLinux 5
Version 5 is based on Yocto Project [2.6](https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html).

To facilitate building this older release this containerized build
environment based on Ubuntu 18.04.

## Quick start

### Ensure that you have enabled docker on your system

Installing and configuration docker is left as an exercize for the reader.

### Download mLinux 

The following instructions were modified from the [mLinux git README](http://git.multitech.net/cgi-bin/cgit.cgi/mlinux.git/tree/README):

XXX - Update below this

```
# clone repo to a dir name of your choice
$ git clone git://git.multitech.net/mlinux.git
$ cd mlinux
# checkout desired branch or tag
$ git checkout 5.3.0d
```
### Download the bitbake_ml script

Download the bitbake_ml script, make it executable and put it in your path.

```
$ wget https://raw.githubusercontent.com/jchonig/mlinux-be/mlinux-5/bitbake_ml
$ chmod +x bitbake_ml
```

### Setup the build environment
```
# initialize git submodules and setup dir structure
$ ./bitbake_ml --setup
# setup.sh generates a random root password, and places the
# password in conf/local.conf and password.txt

# To specify a password use an environmental variable,
# ROOT_PASSWORD
$ ROOT_PASSWORD="3g_t1zX0" setup_ml

# To change the password, remove ROOT_PASSWORD and
# ROOT_PASSWORD_HASH from conf/local.conf and re-run:
$ ROOT_PASSWORD="Y5bG3m_2" setup_ml

# set your default machine type in conf/local.conf
# MACHINE="mtcdt"
#
# build an image
$ ./bitbake_ml mlinux-base-image
```
### Use bitbake_ml

Wherever you would use
```
$ . oe-env.sh
$ bitbake mlinux-base-image
```

Use the bitbake_ml command instead:

```
$ bitbake_ml mlinux-base-image
```
