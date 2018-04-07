FROM centos

ENV GIT_URL=https://github.com/RedHatGov/redhatgov.github.io
ENV GIT_BRANCH=docs

RUN yum -y install wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN wget -O /etc/yum.repos.d/daftaupe-hugo-epel-7.repo  https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo

RUN yum -y install hugo rubygem-asciidoctor git

USER 1001

CMD git clone --branch $GIT_BRANCH $GIT_URL /var/tmp/site && cd /var/tmp/site && hugo server --bind 0.0.0.0


