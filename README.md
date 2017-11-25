# Containerized build environment for Multitech mLinux

[MultiTech](https://www.multitech.com/) [mLinux](http://www.multitech.net/developer/software/mlinux/about-mlinux/) is a [Yocto Project](https://www.yoctoproject.org/) based Linux for the MultiTech Conduit family of products.

## mLinux 3
Version 3. is based on Yocto Project [1.6.1 (daisy)](https://lists.yoctoproject.org/pipermail/yocto-announce/2014-April/000045.html) which was released in 2014 and will not build on later versions of Ubuntu.

To facilitate building this older release this containerized build
environment based on Ubuntu 14.04.

## Quick start

### Ensure that you have enabled docker on your system

Installing and configuration docker is left as an exercize for the reader.

### Download the bitbake_ml script

Download the bitbake_ml script, make it executable and put it in your path.

```
$ wget https://raw.githubusercontent.com/jchonig/mlinux-be/mlinux-3/bitbake_ml
$ chmod +x bitbake_ml
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


