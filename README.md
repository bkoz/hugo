# hugo

Run a hugo server for workshop content.

## Hosting with Docker

```bash
# git clone https://github.com/bkoz/hugo.git

# cd hugo

# docker build --force-rm --rm --tag=centos-hugo .

# docker run --rm -it -p1313:1313 -e GIT_URL=https://github.com/bkoz/redhatgov.github.io -e GIT_BRANCH=bkoz-dev -e APPEND_PORT=true -e BASE_URL=http://localhost centos-hugo
```

## Hosting with OpenShift

Example run commands:

```bash
$ oc new-project workshops
$ oc new-app https://github.com/bkoz/hugo.git -e GIT_URL=https://github.com/bkoz/redhatgov.github.io.git -e GIT_BRANCH=bkoz-dev -e BASE_URL=http://hugo-workshops.apps.eadgbe.net

$ oc expose svc/hugo
```

NOTE: The ```BASE_URL``` environment variable must be set to the OpenShift route
otherwise the rendered web pages will be missing elements. 
If the route is not known in advance, update the deployment config as follows:

```bash
$ oc get routes
NAME      HOST/PORT                        PATH      SERVICES   PORT       TERMINATION   WILDCARD
hugo      hugo-workshops.apps.eadgbe.net             hugo       1313-tcp                 None
```

Use the HOST/PORT value obtained above to set the BASE_URL environment variable.

```bash
$ oc env dc/hugo BASE_URL=http://hugo-workshops.apps.eadgbe.net
```

The change in the deployment configuration should trigger a new pod.

