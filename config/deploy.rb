# application
set :application, "kixo"
set :deploy_to, "/home/kixo/app"

# subversion
set :scm, :git
set :repository,  "git@github.com:optimumweb/kixo.git"

# settings
default_run_options[:pty] = true
set :use_sudo, true

# servers
server "kixo.ca", :app, :web, :db, :primary => true
set :user, "kixo"

# deployment with phusion passenger (mod_rails)

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"