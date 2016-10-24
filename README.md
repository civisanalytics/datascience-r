# datascience-r

This image is created off the official Ubuntu 16.04 Docker image and contains popular R packages for data science.

For details see the requirements.txt file.

## Autobuilding

This repository is set up to autobuild against Dockerhub. You do not need to manually push an image.

## Testing your build

```bash
docker build -t datascience-r:test .
```

## Pushing a new tag

This repo has autobuild enabled. Any PR that is merged to master will be built as the `latest` tag on Dockerhub. Once you are ready to push a new versioned tag, make a tag from the master branch and push it like this:

```bash
git tag -a X.X.X -m "Version X.X.X"
git push origin X.X.X
```
