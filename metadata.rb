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
