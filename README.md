#
Testing puppet modules can get messy when reusing hosts. Unexpected files get installed on a first development run. Troubleshooting occurs for another error. Then you lose that first files installed. Working with a container ensure a fresh template evertime you test a module.
## Preparation
* clone repo
* build /etc/puppetlabs/code, preferably with r10k
* remove latency causing custom facts. Those facts that make curl calls etc
* be prepared for failure errors from systemd, dbus, and cron
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

