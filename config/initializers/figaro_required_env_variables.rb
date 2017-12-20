# The purpose of this initializer it to define which ENV variables are
# expected by this Rails application.
#
# The applicatino's ENV variables first come from the ENV of the shell profile,
# then any missing ENV variables are injected via the config/application.yml
# file.
#
# See https://github.com/laserlemon/figaro for further details on usage

# Please keep these alphabetized!
Figaro.require_keys(
  'application_database_name',
  'blacklight_adapter',
  'cable_adapter',
  'devise_secret_key',
  'fedora_base_path',
  'fedora_password',
  'fedora_url',
  'fedora_username',
  'redis_host',
  'redis_port',
  'secret_key_base',
  'solr_url'
)
