# frozen_string_literal: true
# config valid only for Capistrano 3.1
set :format, :pretty
set :bundle_roles, [:app, :work]
set :bundle_flags, '--deployment --path=vendor/bundle'
set :bundle_cmd, "/opt/ruby/2.4.0/bin/bundle"
set :bundle_without, %w(development test doc).join(' ')
set :application, 'curax'
set :scm, :git
set :repo_url, 'https://github.com/ndlib/curax.git'
set :branch, ENV['BRANCH_NAME'] || 'master'
set :keep_releases, 5
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)
set :secret_repo_name, proc{
  case fetch(:rails_env)
  when 'staging' then 'secret_staging'
  when 'pre_production' then 'secret_pprd'
  when 'production' then 'secret_prod'
  end
}
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:rails_env)}" }
set :whenever_variables, -> { "environment=#{fetch :rails_env}" }

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute "touch #{release_path}/tmp/restart.txt"
    end
  end

  task :db_create do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:create'
        end
      end
    end
  end

  desc 'Perform data migrations via db/data'
  task :data_migrate do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # another missing thing comment out (dltp-1172)
          #execute :rake, 'db:data:migrate'
        end
      end
    end
  end

  desc 'Perform db migrations via db/migrate'
  task :db_migrate do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:migrate'
        end
      end
    end
  end

  desc 'Seed the database'
  task :db_seed do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # Eventually, we'll need something here
          #execute :rake, 'db:seed sipity:environment_bootstrapper'
        end
      end
    end
  end

  desc 'Precompile assets as we are not checking in a version'
  task :precompile_assets do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'assets:precompile'
        end
      end
    end
  end

  desc 'Dump the database'
  task :db_dump do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :ruby, %(./scripts/commands/dump_database)
        end
      end
    end
  end
end

namespace :configuration do
  desc 'Update application secrets'
  task :copy_secrets do
    on roles(:app) do
      within release_path do
        execute "export PATH=/opt/ruby/2.4.0/bin:$PATH && cd #{release_path} && sh scripts/update_secrets.sh #{fetch(:secret_repo_name)}"
      end
    end
  end
end

before 'bundler:install', 'configuration:copy_secrets'
after 'deploy', 'deploy:db_migrate'
after 'deploy:db_migrate', 'deploy:db_seed'
after 'deploy:db_migrate', 'deploy:data_migrate'
after 'deploy:db_migrate', 'deploy:precompile_assets'
after 'deploy', 'deploy:cleanup'
after 'deploy', 'deploy:restart'

require './config/boot'
require 'capistrano/console'
