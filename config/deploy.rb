# application
set :application, "kixo"
set :deploy_to, "/home/kixo/app"

# subversion
set :scm, :git
set :repository,  "git@github.com:optimumweb/kixo.git"
set :branch, "master"
set :git_enable_submodules, 1

# settings
default_run_options[:pty] = true
set :use_sudo, true

# servers
server "kixo.ca", :app, :web, :db, :primary => true
set :user, "kixo"

# deployment with phusion passenger (mod_rails)
namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

# run migrations after deployment
after "deploy:update_code", "deploy:migrate"

# restart passenger after deployment
after :deploy, "passenger:restart"
