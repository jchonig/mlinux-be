# Containerized build environment for Multitech mLinux

[MultiTech](https://www.multitech.com/) [mLinux](http://www.multitech.net/developer/software/mlinux/about-mlinux/) is a [Yocto Project](https://www.yoctoproject.org/) based Linux for the MultiTech Conduit family of products.

*THIS IS CURRENTLY A WORK IN PROGRESS*

## mLinux 5
Version 5 is based on Yocto Project [2.6](https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html).

To facilitate building this older release this containerized build
environment based on Ubuntu 16.04.

Note that while Yocto 2.6 claims that Ubuntu 18.04 is a supported
build environment, mLinux does not list it as a supported
environment.  In addition the checks for a supported build environment
in `layers/meta-mlinux/conf/distro/mlinux.conf` list Ubuntu 16.04, the
casing is wrong so bitbake emits a message indicating that the build
environment is not supported.

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
$ MTADM_PASSWORD=<MTADM_PASSWORD> ./bitbake_ml --setup

# You must specify a password as an environmental variable,
# MTADM_PASSWORD
$ MTADM_PASSWORD="3g_t1zX0" ./bitbake_ml --setup

# To change the password, remove MTADM_PASSWORD and
# MTADM_PASSWORD_HASH from conf/local.conf and re-run:
$ MTADM_PASSWORD="Y5bG3m_2" ./bitbake_ml --setup

# set your default machine type in conf/local.conf
# MACHINE="mtcdt"
#
# build an image
$ ./bitbake_ml mlinux-base-image
```
### Use bitbake_ml

Wherever you would use
```
$ . oe-init-build-env.sh
$ bitbake mlinux-base-image
```

Use the bitbake_ml command instead:

```
$ ./bitbake_ml mlinux-base-image
```
