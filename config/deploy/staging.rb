# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

SSHKit.config.command_map[:bundle] = 'bundle'
SSHKit.config.command_map[:rake] = "#{fetch(:bundle)} exec rake"
set :branch, ENV['BRANCH_NAME'] || 'master'
set :rails_env, 'staging'
set :deploy_to, '/home/app/curax'
set :user,      'app'
set :domain,    fetch(:host, 'testlibnd-curax-dev.library.nd.edu')
set :bundle_without, %w{development test doc}.join(' ')
set :shared_directories,  %w(log)
set :shared_files, %w()
set :linked_files, ['config/blacklight.yml', 'config/database.yml', 'config/fedora.yml', 'config/role_map.yml', 'config/redis.yml', 'config/secrets.yml', 'config/solr.yml']
server fetch(:domain), user: fetch(:user), roles: %w{web app db}

