FROM centos
MAINTAINER Christopher Motes "motescj@aim.com"
RUN yum -y update && \
    yum -q -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm && \
    yum -q -y install puppet-agent && \
    mkdir -p /etc/puppetlabs/puppet/manifests && \
    echo 'include lookup('classes')' | tee /etc/puppetlabs/puppet/manifests/site.pp
VOLUME /Users/cmotes/containers/puppet_centos/facts.d:/opt/puppetlabs/puppet/cache/facts.d
VOLUME /Users/cmotes/containers/puppet_centos/puppet_centos/puppet:/tmp/puppet
VOLUME /etc/puppetlabs/code:/etc/puppetlabs/code
#ENTRYPOINT /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/puppet/manifests/site.pp
