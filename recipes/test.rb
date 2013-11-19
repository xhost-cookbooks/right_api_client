# Cookbook Name:: right_api_client
# Recipe:: test
#
# Copyright 2013, Chris Fordham
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

ruby "test_right_api_client" do
  user node['right_api_client']['configure_users'][0]
  cwd "/tmp"
  code <<-EOH
require 'yaml'
require 'right_api_client'

rightscale = RightApi::Client.new(YAML.load_file(File.join('/home, #{node['right_api_client']['configure_users'][0]}, '.rightscale', 'right_api_client.yml')))

puts rightscale.to_yaml
  EOH
  only_if { node['right_api_client']['test'] }
end
