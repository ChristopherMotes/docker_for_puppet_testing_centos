FROM centos
MAINTAINER Christopher Motes "motescj@aim.com"
RUN yum -y update && \
    yum -q -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm && \
    yum -q -y install puppet-agent && \
    mkdir -p /etc/puppetlabs/puppet/manifests && \
    echo 'include lookup('classes')' | tee /etc/puppetlabs/puppet/manifests/site.pp
