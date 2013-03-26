class OpenBadges::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  desc "Copy the default configuration file to config/initializers/open_badges.rb"
  def copy_initializer_file
    copy_file "initializer.rb", "config/initializers/open_badges.rb"
  end

  def install_migrations
    puts "Copying OpenBadges migrations..."
    Dir.chdir(Rails.root) do
      `rake open_badges:install:migrations`
    end
  end

  def run_migrations
    unless options["no-migrate"]
      puts "Running rake db:migrate"
      `rake db:migrate`
    end
  end
  
  desc "Add the mount for the engine routes"
  def mount_routes
    route("mount OpenBadges::Engine => '/open_badges'")
  end

end