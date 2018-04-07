# hugo
Run a hugo server for workshops

## Using Docker

```bash
# docker build --force-rm --rm --tag=centos-hugo .
# docker run --rm -it -p1313:1313 -e GIT_URL=https://github.com/bkoz/redhatgov.github.io -e GIT_BRANCH=bkoz-dev -e APPEND_PORT=true -e BASE_URL=http://localhost centos-hugo
```

## Using OpenShift

Example run commands:

```bash
$ oc new-app https://github.com/bkoz/hugo.git -e GIT_URL=https://github.com/bkoz/redhatgov.github.io.git -e GIT_BRANCH=bkoz-dev
```
