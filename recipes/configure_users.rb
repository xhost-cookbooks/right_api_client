# Cookbook Name:: right_api_client
# Recipe:: configure_users
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

# currently users share the same credentials for the use case of root using the same rightscale account

node['right_api_client']['configure_users'].each { |user|
  user user do
    home "/home/#{user}"
  end
  
  directory "/home/#{user}/.rightscale" do
    recursive true
  end
  
  template "/home/#{user}/.rightscale/right_api_client.yml" do
    source "right_api_client.yml.erb"
    mode 0400
    owner user
    variables({
      :account_id => node['right_api_client']['rightscale']['account_id'],
      :email => user,
      :api_version => node['right_api_client']['rightscale']['api_version'],
      :api_url => node['right_api_client']['rightscale']['api_url']
    })
  end
}
