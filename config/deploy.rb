require 'mina/rails'
require 'mina/bundler'
require 'mina/git'
require 'mina/rbenv'
require 'mina/puma'

set :whenever_name, 'production'
set :domain,        '192.168.254.105'
set :deploy_to,     '/var/www/gov_catalyst'
set :repository,    'git@github.com:vonchristian/permitbox.git'
set :branch,        'master'
set :user,          'deploy'
set :term_mode,     nil
# set :forward_agent, true
set :app_path,      lambda { "#{fetch(:deploy_to)}/#{fetch(:current_path)}" }
set :stage,         'production'
set :shared_paths,  ['config/database.yml', 'config/master.key', 'tmp/log']
set :shared_dirs, fetch(:shared_dirs, []).push('public/system', 'log', 'tmp/pids', 'tmp/sockets')

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
# set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :remote_environment do
  command %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/log"]

  command %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/tmp/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/tmp/log"]

  command %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/config"]

  command %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/public/system"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/public/system"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/pids"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/pids"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/sockets"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/sockets"]

  command %[touch "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/tmp/log/stdout"]
  command %[touch "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/tmp/log/stderr"]
  command %[touch "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/tmp/pids/puma.pid"]
  command %[touch "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/tmp/sockets/puma.sock"]
  command %[touch "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/config/secrets.yml"]
  command  %[echo "-----> Be sure to edit '#{fetch(:deploy_to)}/#{fetch(:shared_path)}/config/database.yml' and 'secrets.yml'."]

  if fetch(:repository)
    repo_host = fetch(:repository).split(%r{@|://}).last.split(%r{:|\/}).first
    repo_port = /:([0-9]+)/.match(fetch(:repository)) && /:([0-9]+)/.match(fetch(:repository))[1] || '22'

    command %[
      if ! ssh-keygen -H  -F #{repo_host} &>/dev/null; then
        ssh-keyscan -t rsa -p #{repo_port} -H #{repo_host} >> ~/.ssh/known_hosts
      fi
    ]
  end
end

#########################################
desc "Deploys the current version to the server."
task :deploy => :remote_environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:phased_restart'


      # invoke :'whenever:update'
    end
  end
end

namespace :deploy do
  desc "reload the database with seed data"
  task :seed => :remote_environment do
    invoke :'rbenv:load'
    command "cd #{fetch(:current_path)}; bundle exec rails db:seed RAILS_ENV=#{fetch(:stage)}"
  end
end
