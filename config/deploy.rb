require 'mina/rails'
require 'mina/bundler'
require 'mina/git'
require 'mina/rbenv'
require 'mina/puma'

Dir['./lib/mina/*.rb'].each { |mina_task| require mina_task }

set :whenever_name, 'production'
set :domain,        '134.209.100.104'
set :deploy_to,     '/var/www/permitbox'
set :repository,    'git@github.com:vonchristian/permitbox.git'
set :branch,        'master'
set :user,          'deploy'
set :forward_agent, true
set :app_path,      lambda { "#{fetch(:deploy_to)}/#{fetch(:current_path)}" }
set :stage,         'production'
set :shared_paths,  ['config/database.yml', 'log', 'tmp/log', 'public/system', 'tmp/pids', 'tmp/sockets', '/storage']
set :shared_dirs,   fetch(:shared_dirs, []).push('public/system', 'public/packs')

task :remote_environment do
  invoke :'rbenv:load'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.

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
      # invoke :'puma:phased_restart'
      # invoke :'whenever:update'
    end
  end
end

namespace :deploy do
  desc "reload the database with seed data"
  task :seed => :remote_environment do
    command "cd #{fetch(:current_path)}; bundle exec rails db:seed RAILS_ENV=#{fetch(:stage)}"
  end
end
