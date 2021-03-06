#
# Cookbook Name:: logstash-forwarder
# Attribute:: default
# Author:: Pavel Yudin <pyudin@parallels.com>
#
# Copyright (c) 2015, Parallels IP Holdings GmbH
#
#

default['logstash-forwarder']['package_name'] = 'logstash-forwarder'
default['logstash-forwarder']['service_name'] = 'logstash-forwarder'
default['logstash-forwarder']['logstash_servers'] = ['localhost:5043']
default['logstash-forwarder']['timeout'] = 15
default['logstash-forwarder']['config_path'] = '/etc/logstash-forwarder.conf'
default['logstash-forwarder']['version'] = '0.4.0'

# attribute for temporary storing part of config file
default['logstash-forwarder']['files'] = []

case node['platform_family']
when 'rhel', 'fedora'
  default['logstash-forwarder']['ssl_ca'] = '/etc/pki/tls/certs/ca-bundle.crt'
  default['logstash-forwarder']['package_url'] = 'https://download.elasticsearch.org/logstash-forwarder/binaries/logstash-forwarder-%{version}-1.x86_64.rpm'
when 'debian', 'ubuntu'
  default['logstash-forwarder']['ssl_ca'] = '/etc/ssl/certs/ca-certificates.crt'
  default['logstash-forwarder']['package_url'] = 'https://download.elasticsearch.org/logstash-forwarder/binaries/logstash-forwarder_%{version}_amd64.deb'
end
