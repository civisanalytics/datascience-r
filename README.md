# datascience-r

[![CircleCI](https://circleci.com/gh/civisanalytics/datascience-r/tree/master.svg?style=svg)](https://circleci.com/gh/civisanalytics/datascience-r/tree/master)

This image is created from the [rocker/verse](https://hub.docker.com/r/rocker/verse/) Docker image and contains
popular R packages for data science. It also includes the Civis [Python](https://github.com/civisanalytics/civis-python)
and [R](https://github.com/civisanalytics/civis-r) API clients.

# Installation

Either build the Docker image locally
```bash
docker build -t datascience-r .
```

or download the image from DockerHub
```bash
docker pull civisanalytics/datascience-r:latest
```

The `latest` tag (Docker's default if you don't specify a tag)
will give you the most recently-built version of the `datascience-r`
image. You can replace the tag `latest` with a version number such as `1.0`
to retrieve a reproducible environment.

# Usage

To start a Docker container from the `datascience-r` image and
interact with it from a bash prompt, use
```bash
docker run -i -t civisanalytics/datascience-r:latest /bin/bash
```

You can run commands via
```bash
docker run civisanalytics/datascience-r:latest Rscript -e "print('Hello World!')"
```

The image contains environment variables which allow you to find
the current version. There are four environment variables defined:
```
VERSION
VERSION_MAJOR
VERSION_MINOR
VERSION_MICRO
```
VERSION contains the full version string, e.g. "1.0.3". VERSION_MAJOR,
VERSION_MINOR, and VERSION_MICRO each contain a single integer.

# Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for information about contributing to this project.

If you make any changes, be sure to build a container to verify that it successfully completes:
```bash
docker build -t datascience-r:test .
```
and describe any changes in the [change log](CHANGELOG.md).

To maintain the stability of the packge environment, 
update `requirements.txt` with the list of installed packages from the last released
version.

```r
cat(paste0(rownames(installed.packages()), "\n"))
```

# Tag a Release

To integrate with Civis Platform, the following format for releases must be followed:

1. Tag: vX.X.X (major.minor.micro).
2. Title: vX.X.X

The 'Description' field is not used in Civis Platform integration, but by convention it
should have the following format:

Description: [YYYY-MM-DD] followed by summary of changes.

# For Maintainers

This repo has autobuild enabled. Any PR that is merged to master will be built
as the `latest` tag on Dockerhub. Once the release is tagged, DockerHub will
automatically build three identical containers, with labels "major", "major.minor", and "major.minor.micro".

# License

BSD-3

See [LICENSE.md](LICENSE.md) for details.
