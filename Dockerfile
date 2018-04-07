FROM centos:7

RUN curl -o /etc/yum.repos.d/daftaupe-hugo-epel-7.repo  https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo

RUN yum -y install wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm hugo \
    && yum -y install hugo rubygem-asciidoctor git && yum clean all -y

RUN useradd -m hugo && mkdir /hugo \
    && chown hugo:hugo /hugo \ 
    && chmod 777 /hugo

USER hugo
WORKDIR /hugo
ENV HOME /hugo

RUN mkdir -p cache && chmod 777 cache

COPY . ./

EXPOSE 1313

ENV GIT_URL=https://github.com/RedHatGov/redhatgov.github.io
ENV GIT_BRANCH=docs

CMD git config --global user.email "you@example.com" \
    && git config --global user.name "Your Name" \
    && git clone --branch $GIT_BRANCH $GIT_URL /hugo/site \
    && cd /hugo/site \
    && hugo server --bind 0.0.0.0


