#
## command examples
### modules all modules
```
docker run -ti -v /private/etc/puppetlabs/code:/etc/puppetlabs/code/ -v /Users/cmotes/containers/puppet_centos/facts.d:/opt/puppetlabs/puppet/cache/facts.d -v /Users/cmotes/containers/puppet_centos/puppet:/tmp/puppet puppet_centos:latest /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/puppet/manifests/site.pp
```
### test a specific module
```
docker run -ti -v /private/etc/puppetlabs/code:/etc/puppetlabs/code/ -v /Users/cmotes/containers/puppet_centos/facts.d:/opt/puppetlabs/puppet/cache/facts.d -v /Users/cmotes/containers/puppet_centos/puppet:/tmp/puppet puppet_centos:latest /opt/puppetlabs/bin/puppet apply -e "include sshd"
```
### test all modules for a non production environment
```
docker run -ti -v /private/etc/puppetlabs/code:/etc/puppetlabs/code/ -v /Users/cmotes/containers/puppet_centos/facts.d:/opt/puppetlabs/puppet/cache/facts.d -v /Users/cmotes/containers/puppet_centos/puppet:/tmp/puppet puppet_centos:latest /opt/puppetlabs/bin/puppet apply --config /tmp/puppet/puppet.conf.development /etc/puppetlabs/puppet/manifests/site.pp
```
### test a specific module and environment
```
docker run -ti -v /private/etc/puppetlabs/code:/etc/puppetlabs/code/ -v /Users/cmotes/containers/puppet_centos/facts.d:/opt/puppetlabs/puppet/cache/facts.d -v /Users/cmotes/containers/puppet_centos/puppet:/tmp/puppet puppet_centos:latest /opt/puppetlabs/bin/puppet apply --config /tmp/puppet/puppet.conf.development -e "include sshd"
```

