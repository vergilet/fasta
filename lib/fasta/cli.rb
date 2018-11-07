require 'thor'

module Fasta
  class Installer < Thor
    include Thor::Actions
    source_root File.expand_path('../../templates', __dir__)

    desc 'plz NAME', 'Unpack Project'
    def plz(name)
      @name = name
      directory 'config', "#{name}/config"
      create_file "#{name}/app/endpoints/.keep"
      create_file "#{name}/log/db.log"
      directory 'app', "#{name}/app"
      copy_file 'db/migrations/001_create_users_table.rb', "#{name}/db/migrations/001_create_users_table.rb"
      copy_file 'application.rb', "#{name}/application.rb"
      copy_file 'boot.ru', "#{name}/boot.ru"
      copy_file 'Gemfile', "#{name}/Gemfile"
      copy_file 'Procfile', "#{name}/Procfile"
      copy_file 'Rakefile', "#{name}/Rakefile"
    end

    desc 'go', 'Start your application very fast!'
    def go
      exec("puma boot.ru -e production -p 3210")
    end
  end
end
