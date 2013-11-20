name             'right_api_client'
maintainer       'Chris Fordham'
maintainer_email 'chris@fordham-nagy.id.au'
license          'Apache 2.0'
description      'Installs/Configures right_api_client'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'right_api_client', "Installs/configures right_api_client."
recipe 'right_api_client::configure_users', "Configure right_api_client for shell users of the system."
recipe 'right_api_client::install', "Installs right_api_client."
recipe 'right_api_client::test', "Tests right_api_client with a login to RightScale."

attribute "right_api_client/rightscale/account_id",
  :display_name => "right_api_client account ID",
  :description => "The RightScale account ID with right_api_client, e.g. 1337.",
  :require => 'required',
  :recipes => [ "right_api_client", "right_api_client::configure_users" ]

attribute "right_api_client/rightscale/api_url",
  :display_name => "right_api_client API URL",
  :description => "The API base URL to use with right_api_client, e.g. https://us-4.rightscale.com.",
  :default => "https://us-3.rightscale.com",
  :recipes => [ "right_api_client", "right_api_client::configure_users" ],
  :choice => [ "https://us-3.rightscale.com", "https://us-4.rightscale.com", "https://my.rightscale.com", "https://jp-8.rightscale.com" ]

attribute "right_api_client/rightscale/api_version",
  :display_name => "right_api_client API version",
  :description => "The RightScale API version to use with right_api_client, e.g. 1.5",
  :default => "1.5",
  :recipes => [ "right_api_client", "right_api_client::configure_users" ],
  :choice => [ "1.5", "1.0" ]

attribute "right_api_client/rightscale/user",
  :display_name => "right_api_client API user",
  :description => "The RightScale user (email) to use with right_api_client, e.g. bill.gates@microsoft.com.",
  :require => 'required',
  :recipes => [ "right_api_client", "right_api_client::configure_users" ]

attribute "right_api_client/rightscale/password",
  :display_name => "right_api_client API password",
  :description => "The RightScale user password to use with right_api_client.",
  :require => 'required',
  :recipes => [ "right_api_client", "right_api_client::configure_users" ]

attribute "right_api_client/test",
  :display_name => "right_api_client Test",
  :description => "Whether to test connection with right_api_client.",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "right_api_client", "right_api_client::test" ]
  
attribute "right_api_client/configure_users",
  :display_name => "right_api_client configure users",
  :description => "The system users to configure right_api_client with the provided credentials for.",
  :type => 'array',
  :default => [ "rightscale"],
  :recipes => [ "right_api_client", "right_api_client::configure_users" ]
