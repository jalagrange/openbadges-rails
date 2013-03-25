class OpenBadges::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  desc "Copy the default configuration file to config/initializers/open_badges.rb"
  def copy_initializer_file
    copy_file "initializer.rb", "config/initializers/open_badges.rb"
  end
  
  desc "Add the mount for the engine routes"
  def mount_routes
    route("mount OpenBadges::Engine => '/open_badges'")
  end

end