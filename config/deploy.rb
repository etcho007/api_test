
set :application, "api_test"
set :domain, "ubuntu@52.64.58.16"
set :deploy_to, "/var/www/api_test"
set :repository, 'https://github.com/etcho007/api_test.git'
set :revision, "master"

#
# Customize Vlad to our needs
#
namespace :vlad do
  #
  # Add an after_update hook
  #
  remote_task :update do
    Rake::Task['vlad:after_update'].invoke
  end

  #
  # The after_update hook, which is run after vlad:update
  #
  remote_task :after_update do
  # Link to shared resources, if you have them in .gitignore
  # run "ln -s #{deploy_to}/shared/system/database.yml #{deploy_to}/current/config/database.yml"
  end

  #
  # Deploys a new version of your application
  #
  remote_task :deploy => [:update, :migrate, :start_app]
end