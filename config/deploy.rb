require 'bundler/capistrano'

set :application, "frabjous"
set :domain, "frabjous.distributopia.com"
set :location, "ec2-50-16-26-86.compute-1.amazonaws.com"
set :scm, "git"
set :repository, "git@github.com:cks/Frabjous.git"
set :user, "ec2-user"
ssh_options[:keys] = [File.join(ENV["HOME"], "Downloads", "ec2tiny.pem")] 
ssh_options[:forward_agent] = true

#set :git_shallow_clone,   1
#set :keep_releases,       3
#set :bundle_flags,        "--deployment"
#set :bundle_cmd,          '/usr/local/jruby/bin/jruby -S bundle'

set :branch, "master"
#set :deploy_via, :remote_cache
set :deploy_to, "/home/ec2-user/deploy/sites/#{application}"
set :use_sudo, false
role :web, location
role :app, location
role :db, location, :primary => true

namespace :deploy do
  task :cold do
    start
  end

  task :stop do
    run "/sbin/service frabjous stop"
  end

  task :start do
    run "/sbin/service frabjous start"
  end

  task :restart do
    stop
    start
  end
end
