#
# Author:: Sean OMeara (<sean@chef.io>)
# Recipe:: yum-ius::default
#
# Copyright 2013, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

%w(
  ius
  ius-debuginfo
  ius-source
  ius-archive
  ius-archive-debuginfo
  ius-archive-source
  ius-testing
  ius-testing-debuginfo
  ius-testing-source
  ius-dev
  ius-dev-debuginfo
  ius-dev-source
).each do |repo|
  next unless node['yum'][repo]['managed']
  include_recipe 'yum-epel' unless run_context.loaded_recipe?('yum-epel')

  yum_repository repo do
    description node['yum'][repo]['description'] if node['yum'][repo]['description']
    baseurl node['yum'][repo]['baseurl'] if  node['yum'][repo]['baseurl']
    mirrorlist node['yum'][repo]['mirrorlist'] if node['yum'][repo]['mirrorlist']
    gpgcheck node['yum'][repo]['gpgcheck'] if  node['yum'][repo]['gpgcheck']
    gpgkey node['yum'][repo]['gpgkey'] if  node['yum'][repo]['gpgkey']
    enabled node['yum'][repo]['enabled'] if node['yum'][repo]['enabled']
    cost node['yum'][repo]['cost'] if node['yum'][repo]['cost']
    exclude node['yum'][repo]['exclude'] if node['yum'][repo]['exclude']
    enablegroups node['yum'][repo]['enablegroups'] if  node['yum'][repo]['enablegroups']
    failovermethod node['yum'][repo]['failovermethod'] if node['yum'][repo]['failovermethod']
    http_caching node['yum'][repo]['http_caching'] if  node['yum'][repo]['http_caching']
    include_config node['yum'][repo]['include_config'] if node['yum'][repo]['include_config']
    includepkgs node['yum'][repo]['includepkgs'] if node['yum'][repo]['includepkgs']
    keepalive node['yum'][repo]['keepalive'] if  node['yum'][repo]['keepalive']
    max_retries node['yum'][repo]['max_retries'] if node['yum'][repo]['max_retries']
    metadata_expire node['yum'][repo]['metadata_expire'] if node['yum'][repo]['metadata_expire']
    mirror_expire node['yum'][repo]['mirror_expire'] if  node['yum'][repo]['mirror_expire']
    priority node['yum'][repo]['priority'] if node['yum'][repo]['priority']
    proxy node['yum'][repo]['proxy'] if node['yum'][repo]['proxy']
    proxy_username node['yum'][repo]['proxy_username'] if  node['yum'][repo]['proxy_username']
    proxy_password node['yum'][repo]['proxy_password'] if  node['yum'][repo]['proxy_password']
    repositoryid node['yum'][repo]['repositoryid'] if node['yum'][repo]['repositoryid']
    sslcacert node['yum'][repo]['sslcacert'] if node['yum'][repo]['sslcacert']
    sslclientcert node['yum'][repo]['sslclientcert'] if node['yum'][repo]['sslclientcert']
    sslclientkey node['yum'][repo]['sslclientkey'] if node['yum'][repo]['sslclientkey']
    sslverify node['yum'][repo]['sslverify'] if node['yum'][repo]['sslverify']
    timeout node['yum'][repo]['timeout'] if  node['yum'][repo]['timeout']
    action :create
  end
end
